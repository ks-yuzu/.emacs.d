(leaf terraform-mode
  :ensure t
  ;; :bind
  ;; (:terraform-mode-map
  ;;  ("C-c C-a" . (lambda (begin end)
  ;;                 "Align region to equal signs"
  ;;                 (interactive "r")
  ;;                 (align-regexp begin end
  ;;                               (rx (group (zero-or-more (syntax whitespace))) "=") 1 1))))
  :bind
  (:terraform-mode-map ("C-c C-a" . align))
  :config
  (with-eval-after-load 'align
    (add-to-list 'align-rules-list
                 '(terraform-align-equals
                   (regexp . "\\(\\s-*\\)=")
                   (modes  . '(terraform-mode)))))
  )
