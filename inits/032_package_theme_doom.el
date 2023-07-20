;; (leaf *gui
;;   :config

(leaf all-the-icons
  :ensure t
  :config
  (leaf all-the-icons-dired
    :ensure t
    :hook dired-mode-hook))

(leaf doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold . t)
  (doom-themes-enable-italic . t)
  :custom-face
  ;; (doom-modeline-bar . '((t (:background "#6272a4"))))
  (doom-modeline-bar . '((t (:background "#6d4c9c"))))
  :config
  (load-theme 'doom-dracula t)
  ;; (doom-themes-neotree-config)
  ;; (doom-themes-org-config)
  )

(with-eval-after-load 'neotree
  (doom-themes-neotree-config))


