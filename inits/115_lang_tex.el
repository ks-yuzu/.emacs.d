(leaf tex-mode
  :custom
  (tex-compile-commands . '(("tex2pdf %f")
                            ("tex2pdf-landscape %f")
                            ("platex %b.tex && platex %b.tex && dvipdfmx %b.dvi")))
  )
