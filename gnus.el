;;; package --- hooks
;; -*- coding: utf-8-unix; -*-

;;; Commentary:
;; link to this file from ~/.gnus.el

;;; Code:


;; incoming
(setq gnus-select-method '(nnnil "")  ; All servers are equal (no primary server):
      gnus-secondary-select-methods
      '((nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port "imaps")
                (nnimap-stream ssl))))

;; sending mail
(setq smtpmail-smtp-server "smtp.gmail.com"
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      gnus-message-archive-method '(nnimap "imap.gmail.com")
      gnus-message-archive-group "[Gmail]/Sent Mail"
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; settings
(setq user-mail-address "rsmetix@gmail.com"
      user-full-name "René Steetskamp"

      ;; fix as per https://www.reddit.com/r/emacs/comments/bppupo/gnus_gmail_setup_problems/
      gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"

      gnus-article-sort-functions '(not gnus-article-sort-by-date)
      gnus-gcc-mark-as-read t
      gnus-mime-display-multipart-related-as-mixed t
      gnus-thread-sort-functions '((not gnus-thread-sort-by-most-recent-number))
      gnus-summary-line-format "%U%R %&user-date; %(%-15,15f  %B%s%)\n"
      gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
      gnus-thread-sort-functions '(gnus-thread-sort-by-date)
      gnus-sum-thread-tree-false-root ""
      gnus-sum-thread-tree-indent " "
      gnus-sum-thread-tree-leaf-with-other "├► "
      gnus-sum-thread-tree-root ""
      gnus-sum-thread-tree-single-leaf "╰► "
      gnus-sum-thread-tree-vertical "│"
      )

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;;; gnus.el ends here
