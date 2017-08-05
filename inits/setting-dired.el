(eval-after-load "dired"
  '(lambda ()
     (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))
