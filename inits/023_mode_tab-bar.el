(leaf tab-bar-mode
  :emacs>= "27.1"
  :custom
  (tab-bar-new-tab-choice    . "*scratch*")
  (tab-bar-new-button-show   . nil)
  (tab-bar-close-button-show . nil)
  :bind
  ("C-M-]" . tab-next)
  ("C-M-[" . tab-previous)
  :config
  (tab-bar-mode 1)
  )
