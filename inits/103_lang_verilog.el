(leaf verilog-mode
  :ensure t
  :mode (("\\.v$" . verilog-mode)
         ("\\.v\\.erb" . verilog-mode)
         ("\\.v\\.in" . verilog-mode)
         ("\\.inc\\'" . verilog-mode)
         ("\\.vh\\'" . verilog-mode)
         ("\\.vt\\'" . verilog-mode))
  :custom
  (verilog-indent-level             . 2)
  (verilog-indent-level-module      . 2)
  (verilog-indent-level-declaration . 2)
  (verilog-indent-level-behavioral  . 2)
  (verilog-indent-level-directive   . 1)
  (verilog-case-indent              . 2)
  (verilog-auto-newline             . nil)
  (verilog-auto-indent-on-newline   . nil)
  (verilog-tab-always-indent        . t)
  (verilog-auto-endcomments         . nil) ; t)
  (verilog-minimum-comment-distance . 40)
  (verilog-indent-begin-after-if    . t)
  (verilog-auto-lineup              . '(all))
  )
