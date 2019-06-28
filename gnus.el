;; -*- coding: utf-8-unix; -*-

;; link to this file from ~/.gnus.el

(setq user-mail-address "rsmetix@gmail.com"
      user-full-name "René Steetskamp")

;; fix as per https://www.reddit.com/r/emacs/comments/bppupo/gnus_gmail_setup_problems/
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")  ; it could also be imap.googlemail.com if that's your server.
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
