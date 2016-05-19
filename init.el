;;; Code:


(setq load-path
      (append '("~/.emacs.d/inits/") 
			  load-path))

;;(exec-path-from-shell-initialize)


;; shell pass
(add-hook 'comint-output-filter-functions
		  'comint-watch-for-password-prompt)


;-------------------
;   Editor looks
;-------------------

;; ---------- title ----------
(setq frame-title-format
      (if (buffer-file-name)
          (format "emacs - %%f")
        (format "emacs - %%b")))


;; ---------- no bars  ----------
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)


;; ----------  cursor ----------
(set-cursor-color "orange")
(setq cursor-type 'box)
(add-to-list 'default-frame-alist '(cursor-type . 'box))
(setq blink-cursor-interval 0.65)
(setq blink-cursor-delay 1.3)
(blink-cursor-mode 1)

(global-hl-line-mode t)    ; highlight current line
;(custom-set-faces '(hl-line ((t (:background "color-236")))) )
(show-paren-mode t)        ; enphasis paren set


;; ---------- font ----------
(set-face-attribute 'default nil :family "Ricty" :height 120)
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Ricty"))
;; (add-to-list 'face-font-rescale-alist
             ;; '(".*Ricty.*" . 1))


;; (add-to-list 'default-frame-alist '(font . "ricty-12"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(fixed-pitch ((t (:family "Ricty"))))
;;  '(variable-pitch ((t (:family "Ricty")))))



(load "keybinding")


;; ---------- use-package ----------
(unless (require 'use-package nil t)
  (message "Use-package is not available")
  (defmacro use-package (&rest args))
)


;; no startup message
(setq inhibit-startup-message t)

;; delete auto save files when finishing
(setq delete-auto-save-files t)

;; make backup-file in ~/bak
(setq make-backup-files t)
(setq backup-directory-alist
	  (cons
	   (cons "\\.*$" (expand-file-name "~/.bak/emacs/backup/"))
	   backup-directory-alist)
	  )

(setq auto-save-file-name-transforms
	  `((".*", (expand-file-name "~/.bak/emacs/autosave/") t)))

;; background transparent
;(add-to-list 'default-frame-alist '(alpha . (0.75 0.75)))

(if window-system
	(progn
	  (set-background-color "Black")
	  (set-foreground-color "LightGray")
	  (set-cursor-color "Gray")
	  (set-frame-parameter nil 'alpha 85)
	  ))


;; mode-setting
(add-to-list 'auto-mode-alist '("\\.jsp\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'"   . bison-mode))
(add-to-list 'auto-mode-alist '("\\.yy.c\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'"  . shell-script-mode))

(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))


;; tmp perl

(require 'cperl-mode)
(setq cperl-indent-level 4
	  cperl-continued-statement-offset 4
	  cperl-close-paren-offset -4
	  cperl-label-offset -4
	  cperl-comment-column 40
	  cperl-highlight-variables-indiscriminately t
	  cperl-indent-parens-as-block t
	  cperl-tab-always-indent nil
	  cperl-font-lock t
	  cperl-set-style "PerlStyle"
	  )

(add-hook 'cperl-mode-hook
		  '(lambda ()
			 (progn
			   (setq indent-tabs-mode nil)
			   (setq tab-width 4))))



;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))


;-------------------
;      Path
;-------------------
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))



;------------------
;     indent
;------------------
(setq tab-width 4)
(setq-default tab-width 4 indent-tabs-mode nil)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tab-mode t)

(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "bsd")
			 (setq c-basic-offset 4)
             (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t)
			 ))
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "bsd")
			 (setq c-basic-offset 4)
             (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode t)
			 ))


;(add-hook 'haskell-mode-hook  'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook  'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-simple-indent)




;-------------------------
;     package control
;-------------------------

;; ---------- use package ----------
;(use-package package : ensure package)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;(package-refrech-contents)


;; ---------- auto completion ----------
(require 'auto-complete)
(require 'auto-complete-config)
;(global-auto-complete-mode t)
(ac-config-default)


;; ---------- parens ----------
(require 'smartparens)
(require 'rainbow-delimiters)


;; ---------- statusbar ----------
(require 'powerline)
(powerline-default-theme)

(global-anzu-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(custom-safe-themes (quote ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(org-agenda-files nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(sql-product (quote mysql))
 '(tab-width 4))



;; ---------- Flycheck ----------
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-language-standard "c++11")))


;; ---------- Flymake ----------
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(global-set-key "\C-cd" 'flymake-display-err-mune-for-current-line)


;; ---------- helm ----------
(require 'helm-config)
(helm-mode 1)

;; Backspace : C-h
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; complete : TAB
; (define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x b") 'helm-buffers-list)


;; ---------- undo-tree ----------
(require 'undo-tree)
(global-undo-tree-mode t)


;; ---------- setting in each language mode ----------
;; markdown mode
(require 'markdown-mode)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook
		  '(lamdba() (setq markdown-command "mdown") )
)

;; perl-mode
(autoload 'perl-mode "perl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.pl$" . perl-mode))

;; haskell-mode
(require 'haskell-mode)
(autoload 'haskell-mode "haskell-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmonad" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmobar" . haskell-mode))

;; perl
;; (require 'plenv)
;;(plenv-global "5.22.0")

;; (defun flymake-perl()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 					 'flymake-create-temp-with-folder-structure))
;; 		 (local-file (file-relative-name
;; 					  temp-file
;; 					  (file-name-directory buffer-file-name))))
;; 	(list (guess-plenv-perl-path) (list "-wc" local-file))))




;; ;; visual regexp
;; (require 'visual-regexp-steroids)
;; (require 'pcre2el-autoloads)
;; (setq vr/engine 'pcre2el)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

(require 'skk)

(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

;; (load "mail")
;; (load "mysql")
(load-file "~/.emacs.d/inits/org-mode.el")
;; (load "save-visited-files")
(load-file "~/.emacs.d/inits/twittering.el")
;; (load "ditaa")
(load-file "~/.emacs.d/inits/skk-setting.el")
(load-file "~/.emacs.d/inits/tex.el")
;; (load "lookup")
(load "processing")
(load-file "~/.emacs.d/others/141120042304.eww-weblio.el")

;; dummy line
