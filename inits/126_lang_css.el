(add-hook 'css-mode-hook
          '(lambda()
             (local-set-key (kbd "C-c C-a") 'align)
             ))


(add-to-list 'align-rules-list
             '(css-style
               (regexp . ":\\(\\s-*\\)") ; ";" 後のスペースでそろえる
               (modes  . '(css-mode))))
