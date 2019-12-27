(el-get-bundle elpa:xml-rpc)
(el-get-bundle confluence)
(use-package confluence)

(add-to-list 'auto-mode-alist '("\\.cwiki\\'" . confluence-edit-mode))

(add-hook 'confluence-edit-mode-hook
          (lambda ()
            (unless (or (file-exists-p "makefile") (file-exists-p "Makefile"))
              (set (make-local-variable 'compile-command)
                   (concat "perl push.pl "
                           (buffer-file-name))))))
