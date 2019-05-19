(setq-default c-basic-offset 2)

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

