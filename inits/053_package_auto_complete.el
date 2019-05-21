(el-get-bundle auto-complete)

(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

(setq ac-comphist-file "~/.emacs.d/cache/auto-complete/ac-comphist.dat")
