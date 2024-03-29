(leaf org
  :custom
  (system-time-locale            . "C")
  (org-display-custom-times      . t)
  (org-time-stamp-formats        . (quote ("<%Y/%m/%d (%a)>" . "<%Y/%m/%d (%a) %H:%M>")))
  (org-time-stamp-custom-formats . nil)
  (org-use-speed-commands        . t)
  ;; indent for nested list
  (org-startup-indented                  . t)
  (org-indent-mode-turns-on-hiding-stars . nil)
  (org-indent-indentation-per-level      . 2)
  (org-bullets-bullet-list               .  '(;;; Large
                                              "✿"
                                              "▣" ;"□"
                                              "◉"
                                              "○"
                                              "▸"
                                              "▹"
                                              ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
                                              ;;; Small
                                              ;; ► • ★ ▸
                                              ))
  (org-todo-keyword-faces                . '(("TODO"      . (:foreground "orange"  :background "#333333"))
                                             ("WIP"       . (:foreground "yellow"  :background "#333333"))
                                             ("DONE"      . (:foreground "#44aa44" :background "#333333"))
                                             ("REF"       . (:foreground "gray"    :background "#333333"))
                                             ("CANCELLED" . (:foreground "#666666" :background "#333333"))
                                             ))
  :custom-face
  (org-level-1 . '((nil (:inherit outline-1 :bold t :height 1.3))))
  (org-level-2 . '((nil (                   :bold t :height 1.0))))
  (org-level-3 . '((nil (                   :bold nil :height 1.0))))
  (org-level-4 . '((nil (                   :bold nil :height 1.0))))
  (org-level-5 . '((nil (                   :bold nil :height 1.0))))
  (org-level-6 . '((nil (                   :bold nil :height 1.0))))
  (org-level-7 . '((nil (                   :bold nil :height 1.0))))
  (org-level-8 . '((nil (                   :bold nil :height 1.0))))


  :config
  (leaf org-tempo
    :require t)

  (leaf org-bullets
    :ensure t
    :hook
    (org-mode-hook . (lambda () (org-bullets-mode 1)))
    )

  (leaf org-agenda
    :custom
    (org-agenda-files '(expand-file-name "~/todo2.org")) ; 複数可
    :bind
    ("C-c a" . org-agenda)
    ("C-c c" . org-capture)
    :config
    ;; org-captureで扱うファイル
    (setq org-capture-templates
          '(("t" "New TODO" entry
             (file+headline "~/tmp/todo.org" "予定")
             "* TODO %?\n\n")
            ("m" "Memo" entry
             (file+headline "~/tmp/memo.org" "メモ")
             "* %U%?\n%i\n%a")))
    ;; org-agendaでaを押したら予定表とTODOリストを表示
    (setq org-agenda-custom-commands
          '(("a" "Agenda and TODO"
             ((agenda "")
              (alltodo "")))))
    ;; TODOリストに日付つきTODOを表示しない
    (setq org-agenda-todo-ignore-with-date t)
    ;; 今日から予定を表示させる
    (setq org-agenda-start-on-weekday nil)
    )

  (leaf org-re-reveal ;; (leaf ox-reveal
    :ensure t
    :custom
    (org-re-reveal-revealjs-version . "3")
    )

  (leaf org-plantuml
    :disabled
    :config
    (setq org-plantuml-jar-path (expand-file-name "~/bin/plantuml.jar"))
    (add-hook 'org-mode-hook #'(lambda()
                                (org-babel-do-load-languages
                                 'org-babel-load-languages
                                 (add-to-list 'org-babel-load-languages '(plantuml . t))
                                 ))))

  (leaf org-latex
    :disabled
    :custom
    (org-export-latex-coding-system  . 'utf-8)
    (org-export-latex-date-format    . "%Y-%m-%d")
    (org-export-latex-classes        . nil)
    (org-export-latex-packages-alist . '(("AUTO" "inputenc"  t)
                                         ("T1"   "fontenc"   t)))
    (org-latex-pdf-process           . '("~/bin/tex2pdf-no-center %b.tex")) ;; comamnds to generate pdf
    (org-latex-default-class         . "jsarticle")
    (org-latex-classes . '(("jsarticle"
                            "\\documentclass{jsarticle}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"
                            ("\\section{%s}" . "\\section*{%s}")
                            ("\\subsection{%s}" . "\\subsection*{%s}")
                            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                            ("\\paragraph{%s}" . "\\paragraph*{%s}")
                            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))

                           ("jsbook"
                            "\\documentclass{jsbook}
\\usepackage[dvipdfmx]{graphicx}
\\usepackage{url}
\\usepackage{atbegshi}
\\AtBeginShipoutFirst{\\special{pdf:tounicode EUC-UCS2}}
\\usepackage[dvipdfmx,setpagesize=false]{hyperref}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]"

                            ("\\chapter{%s}" . "\\chapter*{%s}")
                            ("\\section{%s}" . "\\section*{%s}")
                            ("\\subsection{%s}" . "\\subsection*{%s}")
                            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                            ("\\paragraph{%s}" . "\\paragraph*{%s}")
                            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                           ))
    )
  )


;; (use-package org-plus-contlib
;;   :ensure)
;; (use-package ox-confluence)
