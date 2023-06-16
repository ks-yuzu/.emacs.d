(leaf js-doc
  :ensure t
  :hook (
  (js-mode-hook . (lambda ()
    (define-key js-mode-map "\C-ci" 'js-doc-insert-function-doc)
    (define-key js-mode-map "@" 'js-doc-insert-tag)))
  (js2-mode-hook . (lambda ()
    (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
    (define-key js2-mode-map "@" 'js-doc-insert-tag)))
  (typescript-mode-hook . (lambda ()
    (define-key typescript-mode-map "\C-ci" 'js-doc-insert-function-doc)
    (define-key typescript-mode-map "@" 'js-doc-insert-tag)))
  ))


