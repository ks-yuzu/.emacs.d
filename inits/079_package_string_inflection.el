(leaf string-inflection
  :ensure t
  :bind
  ("C-c C-u" . string-inflection-all-cycle)
  :config
  (defalias 'snake-case       'string-inflection-underscore-function)  ; EmacsLisp  => emacs_lisp
  (defalias 'pascal-case      'string-inflection-pascal-case-function) ; emacs_lisp => EmacsLisp
  (defalias 'camel-case       'string-inflection-camelcase-function)   ; emacs_lisp => emacsLisp
  (defalias 'upper-snake-case 'string-inflection-upcase-function)      ; emacs_lisp => EMACS_LISP
  (defalias 'kebab-case       'string-inflection-kebab-case-function)  ; emacs_lisp => emacs-lisp
  )

