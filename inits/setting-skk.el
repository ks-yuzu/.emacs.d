;;; Code:

(require 'skk)
(global-set-key "\C-xj" 'skk-mode)


;; 辞書の文字コード指定
(setq skk-jisyo-code 'utf-8)
;; 注) 個人辞書の読み書きの以外の辞書などの読み込みにも影響.
;; - 個人辞書の文字コードを合わせる
;; - L 辞書等の文字コードを合わせる

(setq skk-large-jisyo "~/SKK-JISYO.L.utf8")
;; (setq skk-server-host "localhost"
;; 	  skk-server-portnum 1178
;; 	  skk-server-report-response t)


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


;; context-skk
(require 'context-skk)

;; interactive abbrev
;; (setq skk-dcomp-activate t)

;; ';' マークで変換指定
(require 'skk-hint)
