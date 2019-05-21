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

(add-hook 'cperl-mode-hook
          '(lambda()
             (local-set-key (kbd "C-c C-a") 'align)
             ))



