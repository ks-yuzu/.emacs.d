(leaf flycheck
  :ensure t
  :global-minor-mode global-flycheck-mode
  :tag "minor-mode" "tools" "convenience"
  :bind
  (("M-n" . flycheck-next-error)
   ("M-p" . flycheck-previous-error))
  :hook
  ((c++-mode-hook . (lambda() (setq flycheck-gcc-language-standard   "c++17")))
   (c++-mode-hook . (lambda() (setq flycheck-clang-language-standard "c++17")))
;; (c-mode-hook   . (lambda()
;;                    (setq flycheck-gcc-include-path
;;                          (list (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/include")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/target/dummy_gcc")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/arch/gcc")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/kernel")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/syssvc")
;;                                (expand-file-name "~/works/lab/rtos/toppers/asp3_macosx_xcode-20160515/dummy")))))
   )
  )
