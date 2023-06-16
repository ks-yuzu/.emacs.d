;; (leaf helm
;;   :ensure t
;;   :require t
;;   :config
;;   (leaf helm-config)
;;   (helm-mode -1)
;;   ;; (helm-autoresize-mode t)

;;   ;; bind C-h to delete-backward-char in helm window
;;   (define-key helm-map            (kbd "C-h") 'delete-backward-char)
;;   (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;;   (define-key global-map (kbd "M-x"    ) 'helm-M-x)
;;   (define-key global-map (kbd "C-x C-f") 'helm-find-files)
;;   (define-key global-map (kbd "C-x b"  ) 'helm-buffers-list)
;;   (define-key global-map (kbd "C-x C-b") 'helm-mini)
;;   (define-key global-map (kbd "C-c h o") 'helm-occur)
;;   (define-key global-map (kbd "C-c h g") 'helm-google-suggest)
;;   (define-key global-map (kbd "M-y"    ) 'helm-show-kill-ring)
;;   (global-set-key (kbd "C-x C-z") 'helm-M-x)

;;   (leaf helm-ls-git
;;     :ensure t
;;     :config
;;     (global-set-key (kbd "C-<f1>") 'helm-ls-git-ls)))

(leaf *completion
  :config
  ;; 補完UI
  (leaf vertico
    :ensure t
    :leaf-defer nil
;;  :global-minor-mode t
    :custom
    (vertico-cycle  . t)
    (vertico-count  . 40)
    (vertico-resize . nil)
    :bind
    (:vertico-map
     (("C-j" . vertico-insert)
      ("C-l" . (lambda()
                 (interactive)
                 (end-of-line)
                 (let ((sep (eval-when-compile (regexp-opt '("/" "\\")))))
                   (save-excursion
                     (left-char 1)
                     (when (looking-at-p sep)
                       (delete-char 1)))
                   (save-match-data
                     (when (search-backward-regexp sep nil t)
                       (right-char 1)
                       (filter-buffer-substring (point)
                                                (save-excursion (end-of-line) (point))
                                                #'delete)))))))
     )
    :hook (after-init-hook . vertico-mode)
    )
  (leaf fido-vertical-mode
    :disabled t
    :leaf-defer nil
    :global-minor-mode t
    :custom
    :bind
    )
  ;; 拡張コマンド
  (leaf consult
    :ensure t
    :leaf-defer nil
    :bind
    ("C-x b"   . consult-buffer)              ;; switch-to-buffer
    ("C-x 4 b" . consult-buffer-other-window) ;; switch-to-buffer-other-window
    ("C-x 5 b" . consult-buffer-other-frame)  ;; switch-to-buffer-other-frame
    ("M-y"     . consult-yank-pop)            ;; yank-pop
    ("C-c m"   . consult-mode-command)
    ;; goto
    ("M-g g"   . consult-goto-line)           ;; goto-line
    ("M-g M-g" . consult-goto-line)           ;; goto-line
    ("M-g i"   . consult-imenu)
    ("M-g I"   . consult-imenu-multi)
    ;; search
    ("M-s f" . consult-find)
 ;; ("M-s g" . consult-grep)
    ("M-s g" . consult-ripgrep)
    ("M-s G" . consult-git-grep)
    ("M-s l" . consult-line)
    ("M-s L" . consult-line-multi)
    ("M-s o" . consult-multi-occur)
    )
  ;; 補完スタイル
  (leaf orderless
    :ensure t
    :custom
    (completion-styles         . '(substring orderless))
    (orderless-matching-styles . '(orderless-prefixes
                                   orderless-flex
                                   orderless-regexp
                                   orderless-initialism
                                   orderless-literal))
    )
  ;; ミニバッファで注釈
  (leaf marginalia
    :ensure t
    :leaf-defer nil
    :global-minor-mode t
    :custom
    (marginalia-align . 'center)
    :bind
    ("M-A" . marginalia-cycle)
    (:minibuffer-local-map
     ("M-A" . marginalia-cycle))
    :config
    ;; (leaf all-the-icons-completion
    ;;   :ensure t
    ;;   :hook (after-init-hook))
    :hook (after-init-hook . marginalia-mode)
    )
  )
