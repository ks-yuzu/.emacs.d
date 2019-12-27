(use-package js-doc
  :init (el-get-bundle js-doc)
  :config
  (setq js-doc-mail-address "yuki.osako@gree.net"
        js-doc-author (format "Yuuki Oosako <%s>" js-doc-mail-address)
        ;; js-doc-url "url of your website"
        ;; js-doc-license "license name"
        )
  (add-hook 'js-mode-hook
            '(lambda ()
               (define-key js-mode-map "\C-ci" 'js-doc-insert-function-doc)
               (define-key js-mode-map "@" 'js-doc-insert-tag)))
  (add-hook 'js2-mode-hook
            '(lambda ()
               (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
               (define-key js2-mode-map "@" 'js-doc-insert-tag)))
  (add-hook 'typescript-mode-hook
            '(lambda ()
               (define-key typescript-mode-map "\C-ci" 'js-doc-insert-function-doc)
               (define-key typescript-mode-map "@" 'js-doc-insert-tag)))
  )


