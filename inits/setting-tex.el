;;; Code:

;; 25.1.1
(defvar tex-compile-commands 
  '(
    ("tex2pdf %f")
    ("tex2pdf-landscape %f")))

;; 24.5.1 ??
;; (setq tex-compile-commands
;;       '(
;;         ("platex %b.tex && platex %b.tex && dvipdfmx %b.dvi")
;;         ("tex2pdf %f")))

;; 24.3.1 ??
;; (setq tex-compile-commands
;;       '(
;;         ("platex %r.tex && platex %r.tex && dvipdfmx %r.dvi")
;;         ("tex2pdf %f")))
