;; ---------- Flycheck ----------
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'c++-mode-hook (lambda() (setq flycheck-gcc-language-standard "c++14")))
(add-hook 'c++-mode-hook (lambda() (setq flycheck-clang-language-standard "c++14")))
;; (add-hook 'c-mode-hook (lambda()
;;                          (setq flycheck-gcc-include-path
;;                                (list (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/include")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/target/dummy_gcc")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/arch/gcc")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/kernel")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/syssvc")
;;                                      (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/dummy")))))


;; ---------- Flymake ----------
(require 'flymake)
(setq flymake-gui-warnings-enabled nil)
(add-hook 'find-file-hook 'flymake-find-file-hook)
(global-set-key "\C-cd" 'flymake-display-err-mune-for-current-line)


