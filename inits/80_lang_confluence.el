(el-get-bundle xml-rpc)
(el-get-bundle confluence)
(use-package confluence)

(add-to-list 'auto-mode-alist '("\\.cwiki\\'" . confluence-edit-mode))
