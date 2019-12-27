(use-package yaml-mode
  :init (el-get-bundle yaml-mode))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))



;; lsp

;; npm install -g yaml-language-server
(el-get-bundle lsp-yaml)
(use-package lsp-yaml
  :init (el-get-bundle iquiw/lsp-yaml)
  :after lsp
  ;; :quelpa (lsp-yaml :fetcher github :repo "iquiw/lsp-yaml")
  :hook (yaml-mode
         . (lambda ()
             (setq-local lsp-eldoc-render-all t)
             (eldoc-mode)))
  :config
  (add-hook 'yaml-mode-hook #'lsp)
  (setq lsp-yaml-schemas '(:kubernetes "*.yml")))

