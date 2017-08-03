(if (eq system-type 'gnu/linux)
    (progn
      (set-face-attribute 'default nil :family "Ricty" :height 135)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        (font-spec :family "Ricty"))
      ;; (add-to-list 'face-font-rescale-alist
      ;;              '(".*Ricty.*" . 1))

      ;; (add-to-list 'default-frame-alist '(font . "ricty-12"))
      ;; (custom-set-faces
      ;;  ;; custom-set-faces was added by Custom.
      ;;  ;; If you edit it by hand, you could mess it up, so be careful.
      ;;  ;; Your init file should contain only one such instance.
      ;;  ;; If there is more than one, they won't work right.
      ;;    '(fixed-pitch ((t (:family "Ricty"))))
      ;;    '(variable-pitch ((t (:family "Ricty")))))
))

;; (if (eq system-type 'windows-nt)
(if (eq system-type 'cygwin)
    (progn
      ;; デフォルト フォント
      ;; (set-face-attribute 'default nil :family "Migu 1M" :height 110)
      (set-face-font 'default "Migu 1M-13.5:antialias=standard")

      ;; プロポーショナル フォント
      ;; (set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 110)
      (set-face-font 'variable-pitch "Migu 1M-13.5:antialias=standard")

      ;; 等幅フォント
      ;; (set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height 110)
      (set-face-font 'fixed-pitch "Migu 1M-13.5:antialias=standard")

      ;; ツールチップ表示フォント
      ;; (set-face-attribute 'tooltip nil :family "Migu 1M" :height 90)
      (set-face-font 'tooltip "Migu 1M-13.5:antialias=standard")
))
