;;; Code:

(require 'skk)

(setq skk-server-host "localhost"
	  skk-server-portnum 1178
	  skk-server-report-response t)


(global-set-key "\C-xj" 'skk-mode)
(setq skk-large-jisyo "/home/yuzu/SKK-JISYO.L")


;; henkan by function key
(setq skk-j-mode-function-key-usage 'conversion)

;; auto select hankaku&zenkaku of kutouten & - 
(setq skk-use-auto-kutouten t)

;; toggle by F4
(setq skk-kuten-touten-alist
      (cons '(my-en ". " . ", ")
	    skk-kuten-touten-alist))

(defun toggle-skk-kutouten-type nil
  (interactive)
  (cond
   ((equal skk-kutouten-type 'my-en)
    (setq-default skk-kutouten-type 'jp))
   ((equal skk-kutouten-type 'jp)
    (setq-default skk-kutouten-type 'my-en))
   ((t nil))))

(setq-default skk-kutouten-type 'my-en)


(global-set-key (kbd "<f4>") 'toggle-skk-kutouten-type)

;; (setq skk-kakutei-key "\C-m")

;; muhenkan -> shift
(unless (keymapp key-translation-map)
  (setq key-translation-map (make-sparse-keymap)))

(let ((i ?a))
  (while (<= i ?z)
    (define-key key-translation-map
                (vector 'muhenkan i) (vector (- i 32)))
    (setq i (1+ i))))

;; henkan -> shift
(unless (keymapp key-translation-map)
  (setq key-translation-map (make-sparse-keymap)))

(let ((i ?a))
  (while (<= i ?z)
    (define-key key-translation-map
                (vector 'henkan i) (vector (- i 32)))
    (setq i (1+ i))))

