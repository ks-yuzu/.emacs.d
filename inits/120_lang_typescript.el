;; shell-cmd: npm i -g typescript-language-server; npm i -g typescript

(leaf typescript-mode
  :ensure t
  :mode (("\\.tsx\\'" . typescript-mode))
  :hook
  (typescript-mode-hook . lsp)
  ;(typescript-mode-hook . '(lambda () (setq typescript-indent-level 2)))
  :custom
  (typescript-indent-level . 2)
  )
;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (ansi-color-apply-on-region compilation-filter-start (point-max)))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)




;; (el-get-bundle typescript-mode)
;; (use-package typescript-mode)
;; tss 同梱の typescript.el を使う

;; shell-cmd: npm install -g clausreinke/typescript-tools
;; (el-get-bundle tss)
;; (use-package tss)

;;(font-lock-add-keywords 'typescript-mode
;;                        '(
;;                          ("const\s" . 'hi-blue-b)
;;                          ("async\s" . 'hi-blue-b)
;;                          ("await\s" . 'hi-blue-b)
;;                          ))

;; tss
;; (setq tss-popup-help-key "C-:")
;; (setq tss-jump-to-definition-key "C->")
;; (setq tss-implement-definition-key "C-c i")
;; (tss-config-default)
