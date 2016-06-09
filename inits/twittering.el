;;; Code:

(require 'twittering-mode)

;; 起動時パスワード認証 & パスワード暗号ファイル保存先指定
(setq twittering-use-master-password t)
(setq twittering-private-info-file "~/.emacs.d/inits/twittering-mode.gpg")

;; 表示する書式 - 区切り線いれたら見やすい
;(setq twittering-status-format "%i %S @%s [%@] \n %p %T %r %R \n -------------------------------------------")
(setq twittering-status-format
      (concat
	   ;; icon
	   "%i"
       ;; 年月日表示
       " %C{%Y/%m/%d %H:%M} [%@] %S @%s"
       ;; RT数
       "  %FACE[font-lock-warning-face]{%FIELD-IF-NONZERO[↺%d]{retweet_count}}"
       ;; FAV数
       "  %FACE[font-lock-warning-face]{%FIELD-IF-NONZERO[❤%d]{favorite_count}}"
	   ;; who RT
	    " %R"
	   ;; text
       "\n%FOLD{%T}\n%FACE[glyphless-char]{  -- from %f %r\n}"))

;; アイコンを表示 & サイズ指定 (要 imagemagick)
(setq twittering-icon-mode t)
(setq twittering-convert-fix-size 40)

;; 更新の頻度（sec）
(setq twittering-timer-interval 60)

;; ツイート取得数
(setq twittering-number-of-tweets-on-retrieval 300)


(add-hook 'twittering-mode-hook
		  (lambda ()
			(set-face-bold-p 'twittering-username-face t)
;;			(set-face-foreground 'twittering-username-face "DeepSkyBlue")
			(set-face-attribute 'twittering-username-face nil :underline nil)
			(set-face-attribute 'twittering-username-face nil :foreground "darksalmon")
			(define-key twittering-mode-map (kbd "F") 'twittering-favorite)
            (define-key twittering-mode-map (kbd "R") 'twittering-native-retweet)
			(set-face-foreground 'twittering-uri-face "gray60")
			))


(setq twittering-proxy-server "proxy.ksc.kwansei.ac.jp")
(setq twittering-proxy-port 8080)
(setq twittering-proxy-user "dgy34707")
(setq twittering-proxy-password "Pm4emKbh")


;; o で次のURLをブラウザでオープン
;; (add-hook 'twittering-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "o")
;;                (lambda ()
;;                  (interactive)
;;                  (twittering-goto-next-uri)
;;                  (execute-kbd-macro (kbd "C-m"))
;;                  ))))



