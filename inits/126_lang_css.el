(leaf css-mode
  ;; :mode (("\\.css\\'" . css-mode))
  :custom
  (css-indent-offset . 2)
  :bind
  (:css-mode-map ("C-c C-a" . align))
  :config
  (with-eval-after-load 'align
    (add-to-list 'align-rules-list
                 '(css-align-after-colon
                   (regexp . ":\\(\\s-*\\)")
                   (modes  . '(css-mode)))))
  )

