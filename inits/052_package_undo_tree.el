(leaf undo-tree
  :ensure t
  :global-minor-mode global-undo-tree-mode
  :custom
  (undo-tree-enable-undo-in-region . nil)
  :config
;;(global-undo-tree-mode t)
  (add-to-list 'undo-tree-history-directory-alist
               '(expand-file-name "~/.emacs.d/undotree/")))

