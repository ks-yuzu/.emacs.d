(el-get-bundle migemo)

;; old setting
;; (require 'migemo)
;; (setq migemo-command "/usr/local/bin/cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; ;; Set your installed path
;; (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
;; (setq migemo-coding-system 'utf-8-unix)
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (load-library "migemo")
;; (migemo-init)


;; new setting - 2017/04/26
(when (and (executable-find "/usr/bin/cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

(setq migemo-command "/usr/bin/cmigemo")
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

(setq migemo-pattern-alist-file "~/.emacs.d/cache/migemo/migemo-pattern")
(setq migemo-frequent-pattern-alist-file "~/.emacs.d/cache/migemo/migemo-frequent")
