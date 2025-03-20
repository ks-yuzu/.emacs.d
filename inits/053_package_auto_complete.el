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
  ;; (company-auto-expand t)            ;; 1個目を自動的に補完
  (company-idle-delay            . 0)
  ;; (company-echo-delay 0)
  (company-minimum-prefix-length . 1)
  (company-selection-wrap-around . t)
  (completion-ignore-case        . nil)
  ;; (company-dabbrev-downcase nil)
  ;; (company-dabbrev-char-regexp "\\(\\sw\\|\\s_\\|_\\|-\\)")
  ;; (completion-ignore-case t))

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
   ;; ("C-S-h" . company-show-doc-buffer)
   ("C-s"   . company-filter-candidates))
  (:company-search-map ;; 補完検索時のキーマップ
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous))

  :config
  (leaf company-box
    :ensure t
    :after (company all-the-icons)
    :custom
    (company-box-icons-alist . 'company-box-icons-all-the-icons)
    (company-box-doc-enable  . nil)
    (company-box-max-candidates . 50)
    :hook
    (company-mode . company-box-mode)
    :config
    (with-eval-after-load 'all-the-icons
    (declare-function all-the-icons-faicon 'all-the-icons)
    (declare-function all-the-icons-fileicon 'all-the-icons)
    (declare-function all-the-icons-material 'all-the-icons)
    (declare-function all-the-icons-octicon 'all-the-icons)
    (setq company-box-icons-all-the-icons
          `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.7 :v-adjust -0.15))
            (Text . ,(all-the-icons-faicon "book" :height 0.68 :v-adjust -0.15))
            (Method . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Function . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Constructor . ,(all-the-icons-faicon "cube" :height 0.7 :v-adjust -0.05 :face 'font-lock-constant-face))
            (Field . ,(all-the-icons-faicon "tags" :height 0.65 :v-adjust -0.15 :face 'font-lock-warning-face))
            (Variable . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face))
            (Class . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
            (Interface . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01))
            (Module . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.15))
            (Property . ,(all-the-icons-octicon "package" :height 0.7 :v-adjust -0.05 :face 'font-lock-warning-face)) ;; Golang module
            (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.7 :v-adjust -0.15))
            (Value . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'font-lock-constant-face))
            (Enum . ,(all-the-icons-material "storage" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-orange))
            (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.7 :v-adjust -0.15))
            (Snippet . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face))
            (Color . ,(all-the-icons-material "palette" :height 0.7 :v-adjust -0.15))
            (File . ,(all-the-icons-faicon "file-o" :height 0.7 :v-adjust -0.05))
            (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.7 :v-adjust -0.15))
            (Folder . ,(all-the-icons-octicon "file-directory" :height 0.7 :v-adjust -0.05))
            (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.7 :v-adjust -0.15 :face 'all-the-icons-blueb))
            (Constant . ,(all-the-icons-faicon "tag" :height 0.7 :v-adjust -0.05))
            (Struct . ,(all-the-icons-faicon "clone" :height 0.65 :v-adjust 0.01 :face 'font-lock-constant-face))
            (Event . ,(all-the-icons-faicon "bolt" :height 0.7 :v-adjust -0.05 :face 'all-the-icons-orange))
            (Operator . ,(all-the-icons-fileicon "typedoc" :height 0.65 :v-adjust 0.05))
            (TypeParameter . ,(all-the-icons-faicon "hashtag" :height 0.65 :v-adjust 0.07 :face 'font-lock-const-face))
            (Template . ,(all-the-icons-faicon "code" :height 0.7 :v-adjust 0.02 :face 'font-lock-variable-name-face)))))
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


