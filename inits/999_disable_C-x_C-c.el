(leaf safe-exit
  :bind
  ("C-x C-c" . helm-M-x)
  ;; :config
  ;; (defalias 'exit 'save-buffers-kill-terminal)
  )

(defalias 'exit 'save-buffers-kill-terminal)

