;; verilog-mode
; (require 'verilog-mode)
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             3
      verilog-indent-level-module      3
      verilog-indent-level-declaration 3
      verilog-indent-level-behavioral  3
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   nil
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              '(all))
(setq auto-mode-alist
      ;;; 拡張子とモードの対応
      (append
       '(("\\.v$" . verilog-mode))
       '(("\\.v\\.erb" . verilog-mode))
       '(("\\.v\\.in" . verilog-mode))
       auto-mode-alist))
