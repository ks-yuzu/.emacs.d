(el-get-bundle helm)
(require 'helm-config)
(helm-mode 1)
;; (helm-autoresize-mode t)

;; bind C-h to delete-backward-char in helm window
(define-key helm-map            (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

(define-key global-map (kbd "M-x"    ) 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x b"  ) 'helm-buffers-list)
(define-key global-map (kbd "C-x C-b") 'helm-mini)
(define-key global-map (kbd "C-c h o") 'helm-occur)
(define-key global-map (kbd "C-c h g") 'helm-google-suggest)
(define-key global-map (kbd "M-y"    ) 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-z") 'helm-M-x)


(el-get-bundle helm-ls-git)
(require 'helm-ls-git)
(global-set-key (kbd "C-<f1>") 'helm-ls-git-ls)

