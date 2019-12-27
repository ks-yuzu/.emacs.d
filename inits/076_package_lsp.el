;; shell-cmd: npm i -g typescript-language-server; npm i -g typescript
;; shell-cmd: typescript-language-server --stdio

(el-get-bundle lsp-mode)
(use-package lsp-mode
  :hook (typescript-mode-hook . lsp)
  :commands lsp)

;; typescript-mode
(add-hook    'typscript-mode-hook 'flycheck-mode)

(el-get-bundle lsp-ui)
(use-package lsp-ui :commands lsp-ui-mode)
;; (use-package company-lsp :commands company-lsp)
(el-get-bundle helm-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)
