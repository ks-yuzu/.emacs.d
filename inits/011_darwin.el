(if (eq system-type 'darwin)
    (progn
      ;; CommandとOptionを入れ替える
      (setq ns-command-modifier (quote meta))
      (setq ns-alternate-modifier (quote super)))
)


