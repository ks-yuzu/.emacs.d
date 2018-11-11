;;; Code:


;; =============== PATH ===============
(setq load-path
      (append load-path
              '("~/.emacs.d/inits/")))

;; shell pass
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)


;; =============== EDITOR APPEARANCE ===============
;; window
(if window-system
	(progn
	  (set-background-color "Black")
	  (set-foreground-color "LightGray")
	  (set-cursor-color     "Gray")
	  (set-frame-parameter nil 'alpha 100)))


;; title
(setq frame-title-format
      (format "%%b - %s-%s@%s" invocation-name emacs-version system-name))
      ;; %b : バッファ名
      ;; invocation-name : emacs のプログラム名
      ;; emacs-version : emacs のバージョン
      ;; system-name : ホスト名


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
(setq-default show-trailing-whitespace t)


(load "setting-keybind")
(load "setting-font")

(if (eq system-type 'gnu/linux)
    (load "init-linux") )


;; https://qiita.com/blue0513/items/6e860ba3b769bf0363a5
;; EmacsにFocusが外れている際のFace
(defun my-out-focused-mode-line()
  (set-face-background 'mode-line "gray"))

;; EmacsにFocusが当たっている際のFace
(defun my-in-focused-mode-line()
  (set-face-background 'mode-line "#FFA500"))

;; Hookする
;; (add-hook 'focus-out-hook 'my-out-focused-mode-line)
;; (add-hook 'focus-in-hook 'my-in-focused-mode-line)


;; mac
;; (load "setting-mac")


;; =============== System ===============

;; no startup message
(setq inhibit-startup-message t)

;; make backup files and autosave files in ~/.bak
(setq make-backup-files t)
(add-to-list 'backup-directory-alist         ; backup~
       (cons "\\.*$" (expand-file-name "~/.emacs.d/backup/")))

(setq auto-save-file-name-transforms ; #autosave#
       `((".*", (expand-file-name "~/.emacs.d/autosave/") t)))


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
	  cperl-set-style "PerlStyle")

(add-hook 'cperl-mode-hook
          '(lambda ()
             (progn
               (setq indent-tabs-mode nil)
               (setq tab-width 4))))

(add-to-list 'auto-mode-alist '("\\.pl\\'"  . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm\\'"  . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"   . cperl-mode))

(add-to-list 'interpreter-mode-alist '("perl"     . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5"    . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-to-list 'auto-mode-alist '("\\.inc\\'"  . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.vh\\'"   . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.vt\\'"   . verilog-mode))

(setq js-indent-level 2)


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
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path
         (append (list dir) exec-path))))



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
             (setq comment-start "// ")
             (setq comment-end "")
             (define-key c-mode-base-map (kbd "C-c c")   'compile)
             (define-key c-mode-base-map (kbd "C-c C-c") 'quickrun)
             ))

(add-hook 'sh-mode-hook
          '(lambda()
             (define-key c-mode-base-map (kbd "C-c c")   'quickrun)
             (define-key c-mode-base-map (kbd "C-c C-c") 'quickrun)
             ))

(add-hook 'cperl-mode-hook
          '(lambda()
             (local-set-key (kbd "C-c C-a") 'align)
             ))



;(add-hook 'haskell-mode-hook  'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook  'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-simple-indent)




;; others
;; dired
(setq dired-dwim-target t)



;; =============== Packages ===============

;; ---------- use package ----------
(require 'package)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/")  t)
(add-to-list 'package-archives '("melpa"      . "http://melpa.milkbox.net/packages/")  t)
(add-to-list 'package-archives '("marmalade"  . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org"        . "http://orgmode.org/elpa/")            t)
(package-initialize)

(load-theme 'reverse t)

;; ---------- auto completion ----------
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)


;; ---------- parens ----------
(require 'smartparens)
;; (require 'rainbow-delimiters)


;; ---------- statusbar ----------
(require 'powerline)
(powerline-default-theme)

(global-anzu-mode)

;; ---------- Flycheck ----------
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-language-standard "c++14")))
(add-hook 'c++-mode-hook (lambda() (setq flycheck-clang-language-standard "c++14")))
(add-hook 'c-mode-hook (lambda()
                         (setq flycheck-gcc-include-path
                               (list (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/include")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/target/dummy_gcc")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/arch/gcc")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/kernel")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/syssvc")
                                     (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/dummy")))))


;; ---------- Flymake ----------
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(global-set-key "\C-cd" 'flymake-display-err-mune-for-current-line)


;; ---------- helm ----------
(require 'helm-config)
(helm-mode 1)
;; (helm-autoresize-mode t)

;; Backspace : C-h
(define-key helm-map            (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "M-x"    ) 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x b"  ) 'helm-buffers-list)
(define-key global-map (kbd "C-x C-b") 'helm-mini)
(define-key global-map (kbd "C-c h o") 'helm-occur)
(define-key global-map (kbd "C-c h g") 'helm-google-suggest)


;; ---------- undo-tree ----------
(require 'undo-tree)
(global-undo-tree-mode t)
(setq undo-tree-enable-undo-in-region nil)


;; ---------- setting in each language mode ----------
;; markdown mode
;; (require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode")
(eval-after-load "markdown-mode"
  '(progn
     (setq auto-mode-alist
           (cons '("\\.md" . markdown-mode)
                 auto-mode-alist))
     (add-hook 'markdown-mode-hook
               '(lamdba() (setq markdown-command "mdown")))))

;; haskell-mode
;; (require 'haskell-mode)
(autoload 'haskell-mode "haskell-mode")
(add-to-list 'auto-mode-alist '("\\.hs$"  . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmonad" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmobar" . haskell-mode))


;; web-mode
;; (require 'web-mode)
(autoload 'web-mode "web-mode")
(eval-after-load "web-mode"
  '(setq web-mode-markup-indent-offset 2))

;; ;; visual regexp
;; (require 'visual-regexp-steroids)
;; (require 'pcre2el-autoloads)
;; (setq vr/engine 'pcre2el)

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mysnippets"
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)


;; quickrun
(global-unset-key (kbd "C-c C-c"))
(global-set-key   (kbd "C-c C-c") 'quickrun)


(autoload 'tldr "tldr" "tldr" t)
(autoload 'evil "evil" "evil" t)

;; puml-mode
(add-to-list 'auto-mode-alist '("\\.puml\\'"     . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))


(load "setting-mode-line")
(load "setting-keybind")                     ; reload
(load "setting-dired")
(load "setting-skk")
(load "setting-highlight-symbol")
(load "setting-mail")
;; (load "setting-mail-in-kwansei")
(load "setting-migemo")
(load "setting-quickrun")
(load "setting-git")
(load "setting-evil")
(load "twittering")
(load "verilog")
(load "tools")

;; each language
(load "setting-org-mode")
(load "setting-reveal")
(load "setting-processing")
(load "setting-tex")
(load "setting-js")                     ;TODO: make hook

(load "setting-ediff")
(load "setting-helm")

(load "setting-plenv")
;; (load "flyspell")

;; (load "lookup")
;; (load "save-visited-files")
;; (load "mysql")
;; (load "ditaa")
;; (load-file "~/.emacs.d/others/141120042304.eww-weblio.el")


(global-set-key (kbd "C-x C-c") 'helm-M-x)
(global-set-key (kbd "C-x C-z") 'helm-M-x)
(defalias 'exit 'save-buffers-kill-emacs)

;; Avoid writing 'package-selected-packages' in init.el
(load
 (setq custom-file
       (expand-file-name "inits/custom.el" user-emacs-directory)))
