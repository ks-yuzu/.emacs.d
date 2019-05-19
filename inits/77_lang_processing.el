;;; Code:

(el-get-bundle processing-mode)
(use-package processing-mode)

(setq processing-location "~/bin/processing/processing-java")
(setq processing-application-dir "~/bin/processing")
(setq processing-sketchbook-dir "~/works/processing")

(add-hook 'processing-mode-hook
          '(lambda ()
             (setq processing-mode-code-indent-offset 4)
             (c-set-offset 'case-label '+)
(setq tab-width 4)))


;; (define-package
;;   "processing-snippets" "1.0.0"
;;   "Snippets for processing-mode"
;;   '((yasnippet "0.8.0")))

