(leaf hlinum
  :ensure t
  ;; :custom
  :config
  (defadvice evil-set-cursor-color (after keu-hlinum activate)
    "Reflect cursor color change to `linum-highlight-face' for `hlinum'."
    (set-face-attribute 'linum-highlight-face nil
                        :background (ad-get-arg 0)))
  (hlinum-activate)
  (line-number-mode  1)
  (global-linum-mode t)
  )

;; (setq linum-delay t)
;; (defadvice linum-schedule (around my-linum-schedule () activate)
;;   (run-with-idle-timer 0.2 nil #'linum-update-current))

