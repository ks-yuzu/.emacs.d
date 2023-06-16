(leaf web-mode
  :ensure t
  :mode (
         ("\\.jsp\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.tsx\\'" . web-mode))
  :custom
 (web-mode-markup-indent-offset . 2)
 (web-mode-css-indent-offset    . 2)
 (web-mode-code-indent-offset   . 2)
 (web-mode-sql-indent-offset    . 2)
 )

