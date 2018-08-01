(setq my/hidden-minor-modes
      '(undo-tree-mode
        eldoc-mode
        auto-complete-mode
        magit-auto-revert-mode
        abbrev-mode
        helm-mode
        yasnippet-mode
        flycheck-mode
        skk-mode))

(mapc (lambda (mode)
          (setq minor-mode-alist
                (cons (list mode "") (assq-delete-all mode minor-mode-alist))))
        my/hidden-minor-modes)
