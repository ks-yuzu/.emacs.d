;; others
;; dired
(setq dired-dwim-target t)

(add-hook 'dired-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c C-w") 'wdired-change-to-wdired-mode)
    ))

