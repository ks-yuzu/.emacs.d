(el-get-bundle hlinum)
(require 'hlinum)

(defadvice evil-set-cursor-color (after keu-hlinum activate)
  "Reflect cursor color change to `linum-highlight-face' for `hlinum'."
  (set-face-attribute 'linum-highlight-face nil
                      :background (ad-get-arg 0)))
(hlinum-activate)
(line-number-mode 1)

(global-linum-mode t)

