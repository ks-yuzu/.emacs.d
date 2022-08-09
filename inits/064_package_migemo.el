;; sudo apt install cmigemo
(leaf migemo
  :if (executable-find "cmigemo")
  :ensure t
; :require t
  :custom
  (migemo-command          . "/usr/bin/cmigemo")
  (migemo-dictionary       . "/usr/share/cmigemo/utf-8/migemo-dict")
  (migemo-options          . '("-q" "--emacs"))
  (migemo-user-dictionary  . nil)
  (migemo-regex-dictionary . nil)
  (migemo-coding-system    . 'utf-8-unix)
  ;; cache
  (migemo-pattern-alist-file          . "~/.emacs.d/cache/migemo/migemo-pattern")
  (migemo-frequent-pattern-alist-file . "~/.emacs.d/cache/migemo/migemo-frequent-pattern")
  :hook
  (after-init-hook . migemo-init)
  )
