;; (leaf js-mode
;;   :require js align
;;   :custom
;;   (js-indent-level . 2)
;;   :bind
;;   (:js-mode-map ("C-c C-a" . align))
;;   (:javascript-mode-map ("C-c C-a" . align))
;;   :config
;;   ;; (eval-after-load 'js '(lambda()
;;   ;;                         (define-key js-mode-map (kbd "C-c C-a") 'align)))
;;   (add-to-list 'align-rules-list
;;                '(js-align-equals
;;                  (regexp . "\\(\\s-*\\)=")
;;                  (modes  . '(js-mode))))
;;   (add-to-list 'align-rules-list
;;                '(js-align-after-colon
;;                  (regexp . ":\\(\\s-*\\)")
;;                  (modes  . '(js-mode))))
;;   )

(leaf js-mode
  :custom
  (js-indent-level . 2)
  :bind
  ;; (:js-mode-map ("C-c C-a" . align))
  ;; (:javascript-mode-map ("C-c C-a" . align))
  :config
  (require 'js)
  (require 'align)
  (define-key js-mode-map (kbd "C-c C-a") 'align)
  (add-to-list 'align-rules-list
               '(js-align-equals
                 (regexp . "\\(\\s-*\\)=")
                 (modes  . '(js-mode))))
  (add-to-list 'align-rules-list
               '(js-align-after-colon
                 (regexp . ":\\(\\s-*\\)")
                 (modes  . '(js-mode))))
  )
