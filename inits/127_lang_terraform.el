(el-get-bundle terraform-mode)
(use-package terraform-mode
  :bind
  (("C-c C-a" . (lambda (begin end)
                  "Align region to equal signs"
                  (interactive "r")
                  (align-regexp begin end
                                (rx (group (zero-or-more (syntax whitespace))) "=") 1 1 )))))


