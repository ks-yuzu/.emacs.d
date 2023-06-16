(leaf csharp-mode
  :ensure t omnisharp
  :hook
  (csharp-mode-hook . (lambda ()
             (setq indent-tabs-mode nil)
             (setq c-basic-offset 4)
             (c-set-offset 'substatement-open 0)
             (flycheck-mode 1)
             ;; (omnisharp-mode)
             ;; (lsp)
             )))
