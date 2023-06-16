(leaf yasnippet
  :ensure t
  :global-minor-mode yas-global-mode
  :custom
  (yas-snippet-dirs . '("~/.emacs.d/mysnippets"
                        "~/.emacs.d/snippets"))
  :config
  (leaf helm-c-yasnippet
    :ensure t
    :custom
    (helm-yas-space-match-any-greedy . t)
    :bind
    ("C-c y" . helm-yas-complete))
  )
