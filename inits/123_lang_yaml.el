(leaf yaml-mode
  :ensure t
  :mode (("\\.yml\\'" . yaml-mode))

  :config
  (leaf yaml-lsp
    ;; $ npm install -g yaml-language-server
    :el-get iquiw/lsp-yaml
    :after lsp
    :hook
    ;; (yaml-mode-hook . (lambda ()
    ;;                (setq-local lsp-eldoc-render-all t)
    ;;                (eldoc-mode)))
    (yaml-mode-hook . lsp)
    :config
    (setq lsp-yaml-schemas '(:kubernetes "/*.yaml"))))


(leaf k8s-mode
  :ensure t
  :mode (("\\.patch\\.yaml\\'" . yaml-mode))
)
