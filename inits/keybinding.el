;;; Code:

;; key bind
;(require 'bind-key)

;; move
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(global-set-key "\C-x\C-g" 'goto-line)

(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)    
      (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)

;; edit
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)

(global-unset-key "\C-@")
(global-set-key "\C-@\C-c" 'clipboard-kill-ring-save)
(global-set-key "\C-@\C-v" 'clipboard-yank)
(global-set-key "\C-@\C-x" 'clipboard-kill-region)
