;; (if (eq system-type 'gnu/linux)
(if (member "Ricty" (font-family-list))
    (progn
      (set-face-attribute 'default nil :family "Ricty" :height 120)
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        (font-spec :family "Ricty"))
      ;; (add-to-list 'face-font-rescale-alist
      ;;              '(".*Ricty.*" . 1))
))

;; ;; (if (eq system-type 'windows-nt)
;; (if (eq system-type 'cygwin)
;;     (progn
;;       ;; デフォルト フォント
;;       ;; (set-face-attribute 'default nil :family "Migu 1M" :height 110)
;;       (set-face-font 'default "Migu 1M-13.5:antialias=standard")

;;       ;; プロポーショナル フォント
;;       ;; (set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 110)
;;       (set-face-font 'variable-pitch "Migu 1M-13.5:antialias=standard")

;;       ;; 等幅フォント
;;       ;; (set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height 110)
;;       (set-face-font 'fixed-pitch "Migu 1M-13.5:antialias=standard")

;;       ;; ツールチップ表示フォント
;;       ;; (set-face-attribute 'tooltip nil :family "Migu 1M" :height 90)
;;       (set-face-font 'tooltip "Migu 1M-13.5:antialias=standard")
;; ))
