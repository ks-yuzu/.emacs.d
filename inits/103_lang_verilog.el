;; verilog-mode

; (require 'verilog-mode)
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   nil
      verilog-tab-always-indent        t
      verilog-auto-endcomments         nil ;t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              '(all))
(setq auto-mode-alist
      ;;; 拡張子とモードの対応
      (append
       '(("\\.v$"      . verilog-mode))
       '(("\\.v\\.erb" . verilog-mode))
       '(("\\.v\\.in"  . verilog-mode))
       auto-mode-alist))

(add-to-list 'auto-mode-alist '("\\.inc\\'"  . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.vh\\'"   . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.vt\\'"   . verilog-mode))


