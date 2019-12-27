;; (el-get-bundle typescript-mode)
;; (use-package typescript-mode)
;; tss 同梱の typescript.el を使う

;; shell-cmd: npm install -g clausreinke/typescript-tools
;; (el-get-bundle tss)
;; (use-package tss)

;; typescript-mode
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(setq typescript-indent-level 2)
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


;; tide
;; (package-install 'tide)
;; (require 'tide)
;; (add-hook 'typescript-mode-hook
;; 		  (lambda ()
;; 			(interactive)
;; 			(tide-setup)
;; 			(flycheck-mode +1)
;; 			(setq flycheck-check-syntax-automatically '(save mode-enabled))
;; 			(eldoc-mode +1)
;; 			(tide-hl-identifier-mode +1)
;; 			(company-mode +1)
;; 			(global-set-key (kbd "M-*") 'tide-jump-back)))
