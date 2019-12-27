(el-get-bundle anzu)
(global-anzu-mode)
;TODO: query-replace を anzu reg に

(global-set-key (kbd "M-%") 'anzu-query-replace-regexp)

