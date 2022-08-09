(leaf processing-mode
  :disabled
  :ensure t
  :custom
  (processing-location        . "~/bin/processing/processing-java")
  (processing-application-dir . "~/bin/processing")
  (processing-sketchbook-dir  . "~/works/processing")
  :hook
  (processing-mode-hook . '(lambda ()
                             (setq processing-mode-code-indent-offset 4)
                             (c-set-offset 'case-label '+)
                             (setq tab-width 4)))
  )
