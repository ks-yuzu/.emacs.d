;; haskell-mode

(el-get-bundle haskell-mode)
(use-package haskell-mode)

;(add-hook 'haskell-mode-hook  'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook  'turn-on-haskell-indentation)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook  'turn-on-haskell-simple-indent)

(add-to-list 'auto-mode-alist '("\\.hs$"  . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmonad" . haskell-mode))
(add-to-list 'auto-mode-alist '(".xmobar" . haskell-mode))

