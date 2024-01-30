;;; Code:

(leaf evil
  :ensure t
  :global-minor-mode t
  :custom (
           (confirm-kill-emacs  . 'y-or-n-p)
           (evil-undo-system    . 'undo-tree)
           (evil-default-cursor . 'block)
           (evil-normal-state-cursor . '("green"))
           (evil-insert-state-cursor . '("red" (bar . 2)))
           (evil-visual-state-cursor . '("purple"))
           (evil-motion-state-cursor . '("orange")))
  :bind (
         (evil-normal-state-map ("\C-a" . json-increment-number-at-point))
         (evil-insert-state-map ("\C-a" . beginning-of-line))
         ;; (evil-visual-state-map ("\C-a" . beginning-of-line))
         ;; (evil-motion-state-map ("\C-a" . beginning-of-line))
         ;; (evil-normal-state-map ("\C-e" . end-of-line))
         (evil-insert-state-map ("\C-e" . end-of-line))
         ;; (evil-visual-state-map ("\C-e" . end-of-line))
         ;; (evil-motion-state-map ("\C-e" . end-of-line))
         ;; (evil-normal-state-map ("\C-f" . evil-forward-char))
         (evil-insert-state-map ("\C-f" . forward-char))
         ;; (evil-visual-state-map ("\C-f" . forward-char))
         ;; (evil-normal-state-map ("\C-b" . evil-backward-char))
         (evil-insert-state-map ("\C-b" . backward-char))
         ;; (evil-visual-state-map ("\C-b" . backward-char))
         ;; (evil-normal-state-map ("\C-d" . delete-char))
         (evil-insert-state-map ("\C-d" . delete-char))
         ;; (evil-visual-state-map ("\C-d" . delete-char))
         (evil-normal-state-map ("\C-n" . evil-next-line))
         (evil-insert-state-map ("\C-n" . evil-next-line))
         ;; (evil-visual-state-map ("\C-n" . evil-next-line))
         (evil-normal-state-map ("\C-p" . evil-previous-line))
         (evil-insert-state-map ("\C-p" . evil-previous-line))
         ;; (evil-visual-state-map ("\C-p" . evil-previous-line))
         ;; (evil-normal-state-map ("\C-w" . evil-delete))
         (evil-insert-state-map ("\C-w" . evil-delete))
         ;; (evil-visual-state-map ("\C-w" . evil-delete))
         ;; (evil-normal-state-map ("\C-y" . yank))
         (evil-insert-state-map ("\C-y" . yank))
         ;; (evil-visual-state-map ("\C-y" . yank))
         (evil-normal-state-map ("\C-k" . kill-line))
         (evil-insert-state-map ("\C-k" . kill-line))
         ;; (evil-visual-state-map ("\C-k" . kill-line))
         (evil-insert-state-map ("\C-v" . evil-scroll-down))
         (evil-insert-state-map ("\M-v" . evil-scroll-up))
         (evil-normal-state-map ("Z Z"  . save-buffers-kill-terminal))
         )

  :config
  (blink-cursor-mode -1)
  ;; (if (evil-mode)
  ;;     (progn
  ;;       (bind-keys :map evil-normal-state-map
  ;;                  ("Z Z" . save-buffers-kill-terminal))))
  (evil-ex-define-cmd "q"  #'kill-this-buffer)
  (evil-ex-define-cmd "wq" #'(lambda()
                               (interactive)
                               (save-buffer)
                               (kill-this-buffer)))
  ;; (defadvice update-buffer-local-cursor-color
  ;;   (around evil-update-buffer-local-cursor-color-in-insert-state activate)
  ;;   ;; SKKによるカーソル色変更を, 挿入ステートかつ日本語モードの場合に限定
  ;;   "Allow ccc to update cursor color only when we are in insert
  ;; state and in `skk-j-mode'."
  ;;   (when (and (eq evil-state 'insert) (bound-and-true-p skk-j-mode))
  ;;     ad-do-it))
  ;; (defadvice evil-refresh-cursor
  ;;   (around evil-refresh-cursor-unless-skk-mode activate)
  ;;   ;; Evilによるカーソルの変更を, 挿入ステートかつ日本語モードではない場合に限定
  ;;   "Allow ccc to update cursor color only when we are in insert
  ;; state and in `skk-j-mode'."
  ;;   (unless (and (eq evil-state 'insert) (bound-and-true-p skk-j-mode))
  ;;     ad-do-it))

  ;; (evil-set-initial-state 'wl-folder-mode  'emacs)
  ;; (evil-set-initial-state 'wl-summary-mode 'emacs)
  (add-to-list 'evil-motion-state-modes 'quickrun--mode)
  (add-to-list 'evil-emacs-state-modes 'wl-folder-mode)
  (add-to-list 'evil-emacs-state-modes 'wl-summary-mode)
  (add-to-list 'evil-emacs-state-modes 'mime-view-mode)
  )
