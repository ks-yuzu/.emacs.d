(leaf copilot
  :el-get (copilot
           :type github
           :pkgname "zerolfx/copilot.el")
  :global-minor-mode global-copilot-mode
  :defun copilot-mode

  :bind
  ((:copilot-mode-map
    ("C-<tab>" . 'copilot-accept-completion-by-word))
    ;; ("C-<tab>" . 'copilot-accept-completion-by-line))
   (:copilot-completion-map
    ("C-M-n" . copilot-next-completion)
    ("C-M-t" . copilot-previous-completion)))

  :hook
  (prog-mode . copilot-mode)

  :config
  (leaf editorconfig :ensure t)
  (leaf s            :ensure t)
  (leaf dash         :ensure t)
  (leaf copilot-with-company
    :url "https://github.com/zerolfx/copilot.el/blob/9b13478720581580a045ac76ad68be075466a963/readme.md?plain=1#L153"
    :after company
    :preface
    (defun my/copilot-tab ()
      (interactive)
      (or (copilot-accept-completion)
          (indent-for-tab-command)))
    :bind
    ((:copilot-mode-map
      ("<tab>" . my/copilot-tab)))
    )
  )
