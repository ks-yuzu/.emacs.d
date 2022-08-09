(leaf cperl-mode
  :mode (("\\.pl\\'" . cperl-mode)
         ("\\.pm\\'" . cperl-mode)
         ("\\.t\\'" . cperl-mode))
  :interpreter (("perl" . cperl-mode)
                ("perl5" . cperl-mode)
                ("miniperl" . cperl-mode))
  :custom
  (cperl-indent-level                         . 2)
	(cperl-continued-statement-offset           . 2)
	(cperl-close-paren-offset                   . -2)
	(cperl-label-offset                         . -2)
	(cperl-comment-column                       . 40)
	(cperl-highlight-variables-indiscriminately . t)
	(cperl-indent-parens-as-block               . t)
	(cperl-tab-always-indent                    . nil)
	(cperl-font-lock                            . t)
	(cperl-set-style                            . "PerlStyle")

  :hook
  (cperl-mode-hook . '(lambda()
                        (setq indent-tabs-mode nil)
                        (setq tab-width 4)))
  :bind
  (:cperl-mode-map ("C-c C-a" . 'align))
  )
