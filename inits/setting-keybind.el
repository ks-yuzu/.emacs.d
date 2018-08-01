;;; Code:

;; key bind
;(require 'bind-key)

;; move
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

(global-set-key "\C-x\C-g" 'goto-line)

(global-set-key (kbd "C-x C-j") 'dired-jump)

(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)    
      (beginning-of-line)))
(global-set-key "\C-a" 'my-move-beginning-of-line)

;; edit
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)

;; (global-unset-key "\C-@")
;; (global-set-key "\C-@\C-c" 'clipboard-kill-ring-save)
;; (global-set-key "\C-@\C-v" 'clipboard-yank)
;; (global-set-key "\C-@\C-x" 'clipboard-kill-region)


;; buffer
(defun asterisked? (buf-name)
  (= 42 (car (string-to-list buf-name))))

(defun move-to-scratch ()
  (interactive)
  (let ((current-buffer-name (buffer-name)))
    (next-buffer)
    (while (and (not (string= "*scratch*" (buffer-name)))
                (not (string= current-buffer-name (buffer-name))))
      (next-buffer))))

(defun next-buffer-with-skip* ()
  (interactive)
  (let ((current-buffer-name (buffer-name)))
    (next-buffer)
    (while (and (asterisked? (buffer-name))
                (not (string= current-buffer-name (buffer-name))))
      (next-buffer))))

(defun previous-buffer-with-skip* ()
  (interactive)
  (let ((current-buffer-name (buffer-name)))
    (previous-buffer)
    (while (and (asterisked? (buffer-name))
                (not (string= current-buffer-name (buffer-name))))
      (previous-buffer))))

(global-set-key (kbd "M-[")  'previous-buffer-with-skip*)
(global-set-key (kbd "M-]")  'next-buffer-with-skip*)

;; undo tree 
;(global-set-key (kbd "M-/") 'undo-tree-redo)

;; helm
(global-set-key "\M-y" 'helm-show-kill-ring)

