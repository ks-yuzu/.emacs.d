(leaf dired
  :require t
  :custom
  (dired-dwim-target      . t)
  (dired-recursive-copies . t)
  :bind
  (dired-mode-map (("q"       . kill-this-buffer)
                   ("C-c C-w" . wdired-change-to-wdired-mode)
                   ))
  :config
  (leaf dired-posframe
    :ensure t
    :hook dired-mode-hook
    :bind
    (dired-mode-map
     ("SPC" . dired-posframe-show))
    )
  )
