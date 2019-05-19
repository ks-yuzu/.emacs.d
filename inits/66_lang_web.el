;; web-mode
;; (require 'web-mode)
(autoload 'web-mode "web-mode")
(eval-after-load "web-mode"
  '(setq web-mode-markup-indent-offset 2))

(add-to-list 'auto-mode-alist '("\\.jsp\\'"  . web-mode))

