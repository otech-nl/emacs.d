;;; package --- mail init file

;;; Commentary:
;; using Wanderlust

;;; Code:

(use-package wl
  ;; The name of the package in MELPA is "wanderlust" but the
  ;; feature provided by that package is 'wl
  :ensure wanderlust
  :disabled t
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
   wl-message-ignored-field-list '("^.*")
   wl-message-visible-field-list '("^From:" "^To:" "^Cc:" "^Date:" "^Subject:")
   wl-quicksearch-folder "%[Gmail]/All Mail:rsmetix@imap.gmail.com"
   wl-trash-folder "%[Gmail]/Trash"
   wl-from "René Steetskamp <steets@otech.nl>"
   wl-folder-check-async t

   wl-message-sort-field-list wl-message-visible-field-list
   wl-summary-width 120 ;; No width
   wl-summary-default-sort-spec 'date
   wl-message-window-size '(1 . 2)

   ;; Always download emails without confirmation
   wl-prefetch-threshold nil
   wl-message-buffer-prefetch-threshold nil
   elmo-message-fetch-threshold nil

   ;; Rendering of messages using 'shr', Emacs' simple html
   ;; renderer, but without fancy coloring that distorts the
   ;; looks
   mime-view-text/html-previewer 'shr
   shr-use-colors nil

   wl-draft-config-alist
   '(((string-match "1" "1")
      (bottom . "\n--\n") (bottom-file . "~/.signature"))
     )

   ;; don't ****ing split large messages
   mime-edit-split-message nil
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

;; https://www.djcbsoftware.nl/code/mu/mu4e/Gmail-configuration.html
;; (require 'org-mu4e)  ;; required for capturing
;; (require 'smtpmail)  ;; required for sending email
(use-package mu4e
  :disabled t
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :commands (mu4e mu4e-compose-new mu4e-action-view-in-browser)
  :config
  (setq mail-user-agent 'mu4e-user-agent

        ;; mu4e
        mu4e-maildir "~/Mail"
        mu4e-sent-messages-behavior 'delete  ;; done by IMAP
        ;; mu4e-maildir-shortcuts '( ("/rsmetix/inbox"               . ?i)
        ;;                           ("/rsmetix/send"   . ?s)
        ;;                           ("/rsmetix/trash"       . ?t)
        ;;                           ("/rsmetix/all"    . ?a))
        mu4e-get-mail-command "mbsync -a -c ~/.emacs.d/mbsyncrc"
        mu4e-compose-signature "Met vriendelijke groet,\n\nRené Steetskamp"

        ;; sending messages
        message-send-mail-function 'smtpmail-send-it
        starttls-use-gnutls t
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-auth-credentials '(("smtp.gmail.com" 587 "rsmetix@gmail.com" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        message-kill-buffer-on-exit t
        message-sendmail-f-is-evil 't
        message-cite-style message-cite-style-gmail
        ;; ((message-cite-function 'message-cite-original)
        ;;  (message-citation-line-function 'message-insert-formatted-citation-line)
        ;;  (message-cite-reply-position 'above)
        ;;  (message-yank-prefix "    ")
        ;;  (message-yank-cited-prefix "    ")
        ;;  (message-yank-empty-prefix "    ")
        ;;  (message-citation-line-format "On %e %B %Y %R, %f wrote: "))

        ;; extra
        message-sendmail-extra-arguments '("--read-envelope-from")  ;; send mail using address in message
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-headers-include-related nil

        ;; as per https://www.djcbsoftware.nl/code/mu/mu4e/Retrieval-and-indexing.html
        mu4e-index-cleanup nil      ;; don't do a full cleanup check
        mu4e-index-lazy-check t    ;; don't consider up-to-date dirs
        mu4e-update-interval 300

        ;; as per https://www.reddit.com/r/emacs/comments/bfsck6/mu4e_for_dummies/
        mu4e-view-prefer-html t
        smtpmail-queue-mail nil
        mu4e-attachment-dir "~/Downloads"
        mu4e-confirm-quit nil

        ;; https://www.reddit.com/r/emacs/comments/8q84dl/tip_how_to_easily_manage_your_emails_with_mu4e/
        mu4e-use-fancy-chars t

        ;; as per https://www.djcbsoftware.nl/code/mu/mu4e/Bookmarks.html
        mu4e-bookmarks `(,(make-mu4e-bookmark
                           :name  "Inbox"
                           :query "maildir:/rsmetix/inbox"
                           :key ?i)
                         ,(make-mu4e-bookmark
                           :name  "Unread messages"
                           :query "flag:unread AND NOT flag:trashed"
                           :key ?u)
                         ,(make-mu4e-bookmark
                           :name "Today's messages"
                           :query "date:today..now"
                           :key ?t)
                         ,(make-mu4e-bookmark
                           :name "Last 7 days"
                           :query "date:7d..now"
                           :key ?w)
                         )

        ))

;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;         (concat
;;          "flag:unread maildir:/Exchange/INBOX "
;;          "OR "
;;          "flag:unread maildir:/Gmail/INBOX"
;;          ))
;;   (mu4e-alert-enable-mode-line-display)
;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
;;     (interactive)
;;     (mu4e~proc-kill)
;;     (mu4e-alert-enable-mode-line-display)
;;     )
;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))


(provide 'mail)
;;; mail.el ends here
