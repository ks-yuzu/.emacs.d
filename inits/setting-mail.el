;;; Code:

(autoload 'wl       "wl" "Wanderlust" t)
(autoload 'wl-draft "wl" "Write draft with Wanderlust." t)

;; IMAP
(setq elmo-imap4-default-server            "outlook.office365.com"
;; (setq elmo-imap4-default-server            "webmail.kwansei.ac.jp")
      elmo-imap4-default-user              "fwm83185@nuc.kwansei.ac.jp"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port              '993
      elmo-imap4-default-stream-type       'ssl

      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7         t)

(setq user-mail-address          "fwm83185@kwansei.ac.jp")
(setq user-full-name             "Yuuki Oosako")
(setq smtpmail-smtp-server       "outlook.office365.com")
;; (setq smtpmail-smtp-server       "webmail.kwansei.ac.jp")
(setq wl-smtp-posting-server     "outlook.office365.com")
;; (setq wl-smtp-posting-server     "webmail.kwansei.ac.jp")
(setq mail-user-agent            "message-user-agent")
(setq message-send-mail-function "message-smtpmail-send-it")

;; header setting (Message-ID, To, Cc, Date, From, Subject)
(setq wl-message-ignored-field-list
      '(".*:"))
(setq wl-message-visible-field-list
      '("^To:" "^Subject:" "^From:" "^Date:" "^Cc:"))

;; arrangement of header 
(setq wl-message-sort-field-list
      '("^From:" "^To:" "^Cc:" "^Subject:" "^Date:"))


;; Mew で利用している Maildir 形式のディレクトリと互換
(setq elmo-maildir-folder-path "~/Mail/")

;; HTMLファイルは表示しない。
(setq mime-setup-enable-inline-html nil)

;; 大きいメッセージをフェッチする時に確認しない
(setq elmo-message-fetch-confirm nil)

;; 大きいメッセージを送信時に分割しない
(setq mime-edit-split-message nil)

;; Wanderlust を終了する時は確認する
(setq wl-interactive-exit t)

;; look ... left : mail-folder, right-up : mail-list, right-bottom : mail-content
(setq wl-thread-insert-opened t)
(setq wl-stay-folder-window t)


(setq ssl-certificate-verification-policy 1)

