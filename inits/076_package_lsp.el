;; shell-cmd: npm i -g typescript-language-server; npm i -g typescript
;; shell-cmd: typescript-language-server --stdio

(leaf lsp-mode
  :ensure t
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-prefer-flymake 'flymake)
  :commands (lsp lsp-deferred)
  :config
  (leaf lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :custom
    (lsp-ui-doc-use-childframe . t)
    (lsp-ui-doc-use-webkit     . t)
    (lsp-ui-flycheck-enable . nil)
    (lsp-ui-sideline-enable . t)
    (lsp-ui-sideline-symbol . t)
    (lsp-ui-sideline-hover  . t)
    (lsp-ui-peek-enable      . t)
    (lsp-ui-peek-peek-height . 30)
    (lsp-ui-peek-list-width  . 50)
    :bind
    ("C-M-d" . lsp-ui-peek-find-definitions)
    ("C-M-r" . lsp-ui-peek-find-references)
    )
  ;; (leaf company-lsp
  ;;   :commands company-lsp)
  ;; (leaf helm-lsp
  ;;   :ensure t
  ;;   :commands helm-lsp-workspace-symbol)
  ;; (leaf lsp-treemacs
  ;;   :ensure t
  ;;   :commands lsp-treemacs-errors-list)
  )
