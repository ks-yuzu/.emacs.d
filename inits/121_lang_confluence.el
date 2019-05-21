(el-get-bundle confluence)

;; require がエラーになるので先に設定しておく
(add-to-list 'auto-mode-alist '("\\.cwiki\\'" . confluence-edit-mode))

;; confluence の依存パッケージ xml-rpc が無いため, エラーになる
(require 'confluence)


