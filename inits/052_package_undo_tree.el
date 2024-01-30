(leaf undo-tree
  :ensure t
  :global-minor-mode global-undo-tree-mode
  :custom
  (undo-tree-enable-undo-in-region . nil)
  :config
  (add-to-list 'undo-tree-history-directory-alist
               (cons "\\.*$" (expand-file-name "~/.emacs.d/undotree/")))
  )

