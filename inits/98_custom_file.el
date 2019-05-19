;; custom-file をこのファイルにする
(load
 (setq custom-file
       (expand-file-name "inits/98_custom_file.el" user-emacs-directory)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(org-display-custom-times t)
 '(org-time-stamp-custom-formats nil)
 '(org-time-stamp-formats (quote ("<%Y/%m/%d (%a)>" . "<%Y/%m/%d (%a) %H:%M>")) t)
 '(package-selected-packages (quote (git-commit plenv)))
 '(system-time-locale "C" t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#6272a4")))))
