;;; Code:

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-draft "wl" "Write draft with Wanderlust." t)

(setq user-mail-address "dgy34707@kwansei.ac.jp")
(setq user-full-name "Yuuki Oosako")
(setq smtpmail-smtp-server "outlook.office365.com")
(setq mail-user-agent "message-user-agent")
(setq message-send-mail-function "message-smtpmail-send-it")
