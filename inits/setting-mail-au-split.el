(setq elmo-split-rule
      ;; SPAM は ‘+junk’ へ
      '(
        ;; (
        ;;  (or
        ;;    (address-equal from "i.am@spammer")
        ;;    (address-equal from "dull-work@dull-boy")
        ;;    (address-equal from "death-march@software")
        ;;    (address-equal from "ares@aon.at")
        ;;    (address-equal from "get-money@richman"))
        ;;  "+junk")

        ;; mule メーリングリストからのメールを ‘%mule’ へ
        ((address-equal from "report_spam_ezmf@cs-mail.ezweb.ne.jp") "spam-report")

        ;; ;; wanderlust メーリングリストからのメールを ‘%wanderlust’ へ
        ;; ;; そして続けてそれ以下の規則も評価する。
        ;; ((equal x-ml-name "wanderlust") "%wanderlust" continue)
        ;; ;; Yahoo 利用者からのメッセージを ‘+yahoo-{username}’ へ
        ;; ((match from "\\(.*\\)@yahoo\\.com")
        ;;  "+yahoo-\\1")
        ;; ;; マッチしなかった残りを ‘+inbox’ へ
        ;; (t "+inbox")
        ))
