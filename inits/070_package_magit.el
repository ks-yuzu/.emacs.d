(leaf magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  :config
  (setenv "GIT_EDITOR" "emacsclient")
  )
