;;; package --- mail init file

;;; Commentary:
;; using Wanderlust

;;; Code:

(use-package wl
  ;; The name of the package in MELPA is "wanderlust" but the
  ;; feature provided by that package is 'wl
  :ensure wanderlust
  :init
  (setq
   elmo-imap4-default-authenticate-type 'clear
   elmo-imap4-default-port '993
   elmo-imap4-default-server "imap.gmail.com"
   elmo-imap4-default-stream-type 'ssl
   elmo-imap4-default-user "rsmetix@gmail.com"
   elmo-imap4-use-modified-utf7 t  ; For non ascii-characters in folder-names

   ;; SMTP
   wl-smtp-authenticate-type "plain"
   wl-smtp-connection-type 'starttls
   wl-smtp-posting-port 587
   wl-smtp-posting-server "smtp.gmail.com"
   wl-smtp-posting-user "rsmetix"

   wl-default-folder "%inbox"
   wl-default-spec "%"
   wl-draft-folder "%[Gmail]/Drafts"
   wl-fcc-force-as-read t  ; Mark sent messages as read
   wl-local-domain "gmail.com"
   wl-message-id-domain "smtp.gmail.com"
   wl-quicksearch-folder "%[Gmail]/All Mail:rsmetix@imap.gmail.com"
   wl-trash-folder "%[Gmail]/Trash"
   wl-from "René Steetskamp <steets@otech.nl>"
   wl-folder-check-async t
   )

  (autoload 'wl-user-agent-compose "wl-draft" nil t)
  (if (boundp 'mail-user-agent)
      (setq mail-user-agent 'wl-user-agent))
  (if (fboundp 'define-mail-user-agent)
      (define-mail-user-agent
        'wl-user-agent
        'wl-user-agent-compose
        'wl-draft-send
        'wl-draft-kill
        'mail-send-hook))
  ) ; use-package wanderlust

(provide 'mail)
;;; mail.el ends here
