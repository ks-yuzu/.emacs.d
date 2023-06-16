;; (el-get-bundle auto-complete)

;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (ac-config-default)

;; (setq ac-comphist-file "~/.emacs.d/cache/auto-complete/ac-comphist.dat")

(leaf company
  :url "http://company-mode.github.io/"
  :tag "minor-mode" "convenience"
  :ensure t
  ;; :diminish company-mode
  :global-minor-mode global-company-mode
  :custom
  (company-idle-delay            . 0)
  (company-minimum-prefix-length . 1)
  (company-selection-wrap-around . t)
  (completion-ignore-case        . nil)

  :bind
  ("C-M-i" . company-complete)
  (:company-mode-map
   ("<tab>" . company-indent-or-complete-common))
  (:company-active-map
   ("<tab>" . company-complete-selection)
   ("C-i"   . company-complete-selection)
   ("C-h"   . nil)                      ; unbind
   ("C-M-h" . company-show-doc-buffer)  ; instead of C-h
   ;; ("C-n"   . company-select-next)
   ;; ("C-p"   . company-select-previous)
   ("C-s"   . company-filter-candidates))

  :config
  (leaf company-box
    :ensure t
    :after (company all-the-icons)
    :custom
    (company-box-icons-alist . 'company-box-icons-all-the-icons)
    (company-box-doc-enable  . nil)
    :hook
    (company-mode . company-box-mode)
    )

  (leaf company-css
    :require t
    ;; :commands company-css
    )

  (leaf company-c-headers
    :ensure t
    :require t
    :defvar company-backends company-c-headers-path-system
    :config
    (add-to-list 'company-backends 'company-c-headers)
    (setq company-c-headers-path-system
          (append company-c-headers-path-system (file-expand-wildcards "/usr/include/c++/*")))
    )
  )


