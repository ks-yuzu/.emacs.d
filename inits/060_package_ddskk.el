;;; Code:

(leaf skk
  :ensure ddskk
  :custom
  (default-input-method . "japanese-skk")
  (skk-show-icon  . nil)    ;; モードラインに SKK アイコンを非表示
  (skk-jisyo-code . 'utf-8) ;; 辞書の文字コード指定
                            ;; 注) 個人辞書の読み書きの以外の辞書などの読み込みにも影響.
                            ;; - 個人辞書の文字コードを合わせる
                            ;; - L 辞書等の文字コードを合わせる
  ;; (skk-server-host            . "localhost")
  ;; (skk-server-portnum         . 1178)
  ;; (skk-server-report-response . t)
  (skk-j-mode-function-key-usage . 'conversion) ;; henkan by function key
  (skk-use-auto-kutouten         . t) ;; auto select hankaku&zenkaku of kutouten & -
  (skk-dcomp-activate            . t) ;; http://quruli.ivory.ne.jp/document/ddskk_14.2/skk_4.html#g_t_00e5_008b_0095_00e7_009a_0084_00e8_00a3_009c_00e5_00ae_008c
  :bind
  ("C-x j" . skk-mode)
  :config
  (setq skk-large-jisyo (expand-file-name "~/.SKK-JISYO.L.utf8"))
  (setq skk-jisyo       (expand-file-name "~/.skk-jisyo.utf8"))
  (setq skk-extra-jisyo-file-list
      (list
       "~/.SKK-JISYO.lisp"))

  :config
  (leaf skk-kutouten
    :custom
    (skk-kuten-touten-alist . '((jp . ("。" . "、"))
                                (en . (". " . ", "))))
    :config
    (defun toggle-skk-kutouten-type nil
      (interactive)
      (cond
       ((equal skk-kutouten-type 'en)
        (setq-default skk-kutouten-type 'jp))
       ((equal skk-kutouten-type 'jp)
        (setq-default skk-kutouten-type 'en))
       ((t nil))))
    (global-set-key (kbd "<f4>") 'toggle-skk-kutouten-type)
    (setq-default skk-kutouten-type 'en))

  (leaf skk-muhenkan2shift ;; muhenkan -> shift
    :config
    (unless (keymapp key-translation-map)
      (setq key-translation-map (make-sparse-keymap)))

    (let ((i ?a))
      (while (<= i ?z)
        (define-key key-translation-map
          (vector 'muhenkan i) (vector (- i 32)))
        (setq i (1+ i)))))

  (leaf skk-henkan2shift ;; henkan -> shift
    :config
    (unless (keymapp key-translation-map)
      (setq key-translation-map (make-sparse-keymap)))

    (let ((i ?a))
      (while (<= i ?z)
        (define-key key-translation-map
          (vector 'henkan i) (vector (- i 32)))
        (setq i (1+ i)))))

  (eval-after-load 'skk
    '(progn
       (require 'context-skk)
       (require 'skk-hint))) ;; ';' マークで変換指定
       )
