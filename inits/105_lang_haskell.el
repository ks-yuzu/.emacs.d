(leaf haskell-mode
  :ensure t
  :mode (("\\.hs$"  . haskell-mode)
         (".xmonad" . haskell-mode)
         (".xmobar" . haskell-mode))
  :hook (
         ;; (haskell-mode-hook . turn-on-haskell-doc-mode)
         (haskell-mode-hook . turn-on-haskell-indentation)
         ;; (haskell-mode-hook . turn-on-haskell-indent)
         ;; (haskell-mode-hook . turn-on-haskell-simple-indent)
         ))
