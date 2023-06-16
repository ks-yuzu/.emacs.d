;; custom-file をこのファイルにする
(setq custom-file
       (expand-file-name "inits/998_custom_file.el" user-emacs-directory))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" default))
 '(doom-themes-enable-bold t)
 '(doom-themes-enable-italic t)
 '(imenu-list-position 'left t)
 '(imenu-list-size 30 t)
 '(org-display-custom-times t)
 '(org-time-stamp-custom-formats nil)
 '(org-time-stamp-formats '("<%Y/%m/%d (%a)>" . "<%Y/%m/%d (%a) %H:%M>") t)
 '(package-archives
   '(("org" . "https://orgmode.org/elpa/")
     ("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(lsp-ui company csharp-mode ox-reveal tldr git-commit plenv))
 '(system-time-locale "C" t)
 '(warning-suppress-types '((comp))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-bar ((t (:background "#6d4c9c"))) nil "Customized with leaf in `doom-themes' block at `/mnt/d/wsl-home/.emacs.d/inits/032_package_theme_doom.el'"))
