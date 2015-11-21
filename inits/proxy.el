;;; Code:

(setq url-proxy-services 
	  '(
		("http" . "proxy.ksc.kwansei.ac.jp:8080")
		("https" . "proxy.ksc.kwansei.ac.jp:8080")
		)
	  )

(setq url-http-proxy-basic-auth-storage
	  (list
	   (list "proxy.ksc.kwansei.ac.jp:8080"
			 (cons "/"
				   (base64-encode-string "dgy34707:Pm4emKbh")))))
