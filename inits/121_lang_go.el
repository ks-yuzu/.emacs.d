;; $ go get golang.org/x/tools/gopls@latest             # Language Server
;; $ go get -v github.com/uudashr/gopkgs/cmd/gopkgs     # Go パッケージ
;; $ go install golang.org/x/tools/cmd/goimports@latest # import の過不足を自動で補完
(leaf go-mode
  :ensure t
  :custom
  (gofmt-command . "goimports")
  :hook
  (go-mode-hook . (lambda()
                    (lsp)
                    (local-set-key (kbd "M-m") 'xref-pop-marker-stack)
                    (local-set-key (kbd "M-.") 'xref-find-definitions)
                    (local-set-key (kbd "M-/") 'xref-find-references)

                    ;; set compile command
                    (if (not (string-match "go" compile-command))
                        (set (make-local-variable 'compile-command)
                             "time go build -v && go test -v && go vet"))
                    ))
  (before-save-hook . gofmt-before-save) ;; format by goimports
  )
