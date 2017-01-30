(setq org-agenda-files '("~/works/tasklist/tasklist-4th.org"))

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-latex-pdf-process
	  '("~/bin/tex2pdf %b.tex"))

;; unbind C-, to use for moving the previous buffer
(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "C-,") nil)
     ))


;; PlantUML in Org-mode
(setq org-plantuml-jar-path "/home/yuzu/bin/plantuml.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)
