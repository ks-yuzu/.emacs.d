;;; Code:

;; =============== PATH ===============

(setq load-path
      (append '("~/.emacs.d/inits/")
           ;; '("~/.emacs.d/org-8.3.4/lisp")
           ;; '("~/.emacs.d/org-8.3.4/contlib/lisp")
			  load-path))

;;(exec-path-from-shell-initialize)

;; shell pass
(add-hook 'comint-output-filter-functions
		  'comint-watch-for-password-prompt)



;; =============== Editor Appearance ===============

;; window
(if window-system
	(progn
	  (set-background-color "Black")
	  (set-foreground-color "LightGray")
	  (set-cursor-color "Gray")
	  (set-frame-parameter nil 'alpha 85)
	  ))

;; background transparency
;; (add-to-list 'default-frame-alist '(alpha . (0.75 0.75)))


;; title
(setq frame-title-format
      (if (buffer-file-name)
          (format "emacs - %%f")
        (format "emacs - %%b")))

;; hide bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)


;; cursor
(set-cursor-color "orange")
(setq cursor-type 'box)
(add-to-list 'default-frame-alist '(cursor-type . 'box))
(setq blink-cursor-interval 0.8)
(setq blink-cursor-delay 1.3)
(blink-cursor-mode 1)


;; syntax highlight
(show-paren-mode t)        ; enphasis paren set
 ;; (global-hl-line-mode t)    ; highlight current line
 ;; (custom-set-faces '(hl-line ((t (:background "color-236")))) )

;; font
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


;; =============== System ===============

;; no startup message
(setq inhibit-startup-message t)

;; make backup files and autosave files in ~/.bak
(setq make-backup-files t)
(setq backup-directory-alist
	  (cons
	   (cons "\\.*$" (expand-file-name "~/.bak/emacs/backup/"))
	   backup-directory-alist))

(setq auto-save-file-name-transforms
	  `((".*", (expand-file-name "~/.bak/emacs/autosave/") t)))


;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))



;; =============== mode specification ===============
(add-to-list 'auto-mode-alist '("\\.jsp\\'"  . web-mode))
(add-to-list 'auto-mode-alist '("\\.ll\\'"   . bison-mode))
(add-to-list 'auto-mode-alist '("\\.yy.c\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'"  . shell-script-mode))


;; perl
(require 'cperl-mode)
(setq cperl-indent-level 2
	  cperl-continued-statement-offset 2
	  cperl-close-paren-offset -2
	  cperl-label-offset -2
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

(add-to-list 'auto-mode-alist '("\\.pl\\'"   . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm\\'"   . cperl-mode))

(add-to-list 'interpreter-mode-alist '("perl"     . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5"    . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))




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

(setq-default c-basic-offset 2
              tab-width 2
              indent-tab-mode t)

(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "bsd")
			 (setq c-basic-offset 2)
             (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode nil)
             (c-set-offset 'case-label '+)
             (c-set-offset 'access-label '*)
             (define-key c-mode-base-map (kbd "C-c c")   'compile)
             (define-key c-mode-base-map (kbd "C-c C-c") 'quickrun)
			 ))
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "bsd")
			 (setq c-basic-offset 2)
             (setq tab-width c-basic-offset)
			 (setq indent-tabs-mode nil)
             (c-set-offset 'case-label '+)
             (c-set-offset 'access-label '*)
             (setq comment-start "//")
             (setq comment-end "")
             (define-key c-mode-base-map (kbd "C-c c")   'compile)
             (define-key c-mode-base-map (kbd "C-c C-c") 'quickrun)
			 ))

;(add-hook 'haskell-mode-hook  'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook  'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-simple-indent)




;; =============== Packages ===============

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

;; ---------- Flycheck ----------
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-language-standard "c++14")))


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
;; (define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)
;; (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; use C-i instead of this

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

;; haskell-mode
(require 'haskell-mode)
(autoload 'haskell-mode "haskell-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmonad" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmobar" . haskell-mode))


;; web-mode
(require 'web-mode)
(setq web-mode-markup-indent-offset 2)

;; ;; visual regexp
;; (require 'visual-regexp-steroids)
;; (require 'pcre2el-autoloads)
;; (setq vr/engine 'pcre2el)

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mysnippets"
        "~/.emacs.d/elpa/yasnippet-20160801.1142/snippets"
        ))

(yas-global-mode 1)


;; quickrun
(global-unset-key (kbd "C-c C-c"))
(global-set-key (kbd "C-c C-c") 'quickrun)


(autoload 'tldr "tldr" "tldr" t)
(autoload 'evil "evil" "evil" t)

;; puml-mode
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

(load "mail")
;; (load "migemo-setting")
(load "org-mode")
(load "git")
(load "twittering")
(load "skk-setting")
(load "tex")
(load "processing")
(load "verilog")
(load "tools")
(load "setting-highlight-symbol")
(load "plenv-setting")
;; (load "flyspell")
(load "keybinding")                     ; reload

;; (load "lookup")
;; (load "save-visited-files")
;; (load "mysql")
;; (load "ditaa")
;; (load-file "~/.emacs.d/others/141120042304.eww-weblio.el")


;; Avoid writing 'package-selected-packages' in init.el
(load
 (setq custom-file
       (expand-file-name "inits/custom.el" user-emacs-directory)))
