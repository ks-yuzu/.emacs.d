(add-to-list 'auto-mode-alist '("\\.zsh\\'"  . shell-script-mode))

(add-hook 'sh-mode-hook
          '(lambda()
             (define-key c-mode-base-map (kbd "C-c c")   'quickrun)
             (define-key c-mode-base-map (kbd "C-c C-c") 'quickrun)
             ))


