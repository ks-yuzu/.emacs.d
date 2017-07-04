(require 'align)
;; (add-to-list 'align-rules-list
;;              '(latex-table
;;                (regexp . "\\(\\s-*\\)&")
;;                (modes  . '(latex-mode))))


(add-to-list 'align-rules-list
             '(camma-table
               (regexp . ",\\( *\\)")
               (repeat . t)              ; 複数回適用を有効に
               (modes  . '(perl-mode))))

(add-to-list 'align-rules-list
             '(pipe-table
               (regexp . "|\\( *\\)")
               (repeat . t)              ; 複数回適用を有効に
               (modes  . '(markdown-mode))))
