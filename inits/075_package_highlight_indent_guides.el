(leaf highlight-indent-guides
  :ensure t
  :diminish
  :hook
  ((prog-mode-hook yaml-mode-hook) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled . t)
  (highlight-indent-guides-responsive   . t)
  (highlight-indent-guides-method       . 'column))


