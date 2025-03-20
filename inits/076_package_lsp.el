;; shell-cmd: npm i -g typescript-language-server; npm i -g typescript
;; shell-cmd: typescript-language-server --stdio

(leaf lsp-mode
  :ensure t
  :leaf-defer nil
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-prefer-flymake 'flymake)
  ;; debug
  ;; (lsp-print-io nil)
  ;; (lsp-trace nil)
  ;; (lsp-print-performance nil)
  ;; general
  (lsp-auto-guess-root t)
  (lsp-document-sync-method 'incremental) ;; always send incremental document
  (lsp-response-timeout 5)
  ;; (lsp-enable-completion-at-point nil)
  :commands (lsp lsp-deferred)
  :config
  (leaf lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :custom
    ;; lsp-ui-doc
    ;; (lsp-ui-doc-enable t)
    ;; (lsp-ui-doc-header t)
    ;; (lsp-ui-doc-include-signature t)
    ;; (lsp-ui-doc-position 'top) ;; top, bottom, or at-point
    ;; (lsp-ui-doc-max-width 150)
    ;; (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe . t)
    (lsp-ui-doc-use-webkit     . t)
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable . nil)
    ;; lsp-ui-sideline
    (lsp-ui-sideline-enable . t)
    (lsp-ui-sideline-symbol . t)
    (lsp-ui-sideline-hover  . t)
    ;; (lsp-ui-sideline-ignore-duplicate t)
    ;; (lsp-ui-sideline-show-symbol t)
    ;; (lsp-ui-sideline-show-hover t)
    ;; (lsp-ui-sideline-show-diagnostics t)  ;nil
    ;; (lsp-ui-sideline-show-code-actions t) ;nil
    ;; lsp-ui-imenu
    ;; (lsp-ui-imenu-enable nil)
    ;; (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable      . t)
    (lsp-ui-peek-peek-height . 30)
    (lsp-ui-peek-list-width  . 50)
    ;; (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always)
    :bind
    ("C-M-d" . lsp-ui-peek-find-definitions)
    ("C-M-r" . lsp-ui-peek-find-references)
    )
  ;; (leaf company-lsp
  ;;   :commands company-lsp
  ;;   :custom
  ;;   (company-lsp-cache-candidates t) ;; always using cache
  ;;   (company-lsp-async t)
  ;;   (company-lsp-enable-recompletion nil))
  ;; (leaf helm-lsp
  ;;   :ensure t
  ;;   :commands helm-lsp-workspace-symbol)
  ;; (leaf lsp-treemacs
  ;;   :ensure t
  ;;   :commands lsp-treemacs-errors-list)
  )
