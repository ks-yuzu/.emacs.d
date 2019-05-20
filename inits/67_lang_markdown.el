;; markdown mode
(el-get-bundle markdown-mode)
(use-package markdown-mode)

(eval-after-load "markdown-mode"
  '(progn
     (setq auto-mode-alist
           (cons '("\\.md" . markdown-mode)
                 auto-mode-alist))
     (add-hook 'markdown-mode-hook
               '(lamdba() (setq markdown-command "mdown")))))

(set-face-attribute 'markdown-code-face nil :inherit 'default)
