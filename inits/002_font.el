(leaf *font
  :preface
  (defun _set-font (font-name font-size)
    (if (member font-name (font-family-list))
        (progn
          (set-face-attribute 'default nil :family font-name :height font-size)
          (set-fontset-font (frame-parameter nil 'font)
                            'japanese-jisx0208
                            (font-spec :family font-name))
          ;; (add-to-list 'face-font-rescale-alist
          ;;              (cons (format ".*%s.*" font-name) 1))
          )))

  (defun set-font (frame)
    (select-frame frame)
    (_set-font "Ricty" 135)
    (_set-font "Cica" 150))

  :config
  (set-font (selected-frame))
  (add-hook 'after-make-frame-functions 'set-font)
  )


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
