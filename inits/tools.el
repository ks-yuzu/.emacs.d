(defun mark-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (mark-word ))
     (t (forward-char) (backward-word) (mark-word 1)))))

(global-set-key "\M-@" 'mark-word-at-point)
