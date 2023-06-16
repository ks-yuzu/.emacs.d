(leaf confluence
  :url https://mirrors.zju.edu.cn/elpa/melpa/confluence-readme.txt
  :el-get jahlborn/confluence-el elpa:xml-rpc
  :mode (("\\.cwiki\\'" . confluence-edit-mode))
  :hook
  (confluence-edit-mode-hook . (lambda ()
                                 (unless (or (file-exists-p "makefile") (file-exists-p "Makefile"))
                                   (set (make-local-variable 'compile-command)
                                        (concat "perl push.pl "
                                                (buffer-file-name))))))
  :config
  )

