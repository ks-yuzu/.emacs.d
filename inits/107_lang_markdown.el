(leaf markdown-mode
  :ensure t
  :mode
  ("\\.md\\'" . markdown-mode)
  ;; :custom
  ;; (markdown-command . "mdown")
  :config
  (set-face-attribute 'markdown-code-face nil :inherit 'default)
  )
