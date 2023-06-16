(leaf c++-mode
  :custom
  (c-basic-offset . 2)
  :bind
  (:c-mode-base-map  ("C-c c" . compile))
  :hook
  ((c-mode-hook c++-mode-hook) . (lambda()
                                    (c-set-style "bsd")
                                    (setq tab-width c-basic-offset)
                                    (setq indent-tabs-mode nil)
                                    (c-set-offset 'case-label '+)
                                    (c-set-offset 'access-label '*)
                                    (setq comment-start "// ")
                                    (setq comment-end "")
                                    ))
  )
