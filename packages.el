;;; package --- package management

;;; Commentary:
;; using use-package

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; bootstrap use-package (https://github.com/jwiegley/use-package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t
      use-package-always-defer nil)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; actual packages

(use-package activity-watch-mode
  :config
  (global-activity-watch-mode))

;; silversearcher (https://agel.readthedocs.io/, https://geoff.greer.fm/ag/)
(use-package ag
  :disabled t  ;; feels clunky
  :commands (ag ag-regexp ag-project)
  :config
  (setq ag-highlight-search t
        ag-reuse-buffers 't)
  )

;; pretty icons (needed by several other packages)
(use-package all-the-icons)

;; flashes the cursor's line when you scroll
(use-package beacon
  :disabled t  ;; annoying
  :config (beacon-mode 1)
  ;; (setq beacon-color "#666600")
  )

;; complete anything (https://company-mode.github.io/)
(use-package company)

;; counsel adds suggestions in the minibuffer with M-o
;; swiper replaces isearch
;; ivy is a completion framework
(use-package counsel  ;; counsel depends on swiper, which depends on ivy
  :disabled t  ;; elpy depends on company
  :config
  ;; ivy
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t)

  ;; swiper
  (global-set-key "\C-s" 'swiper)

  ;; counsel
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package diminish)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; spell checking text modes and code comments
(use-package flyspell
  :init
  (setq ispell-program-name "aspell"
        ispell-list-command "--list")
  :config
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;; fix mouse
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  (define-key flyspell-mouse-map [mouse-3] #'undefined))

(use-package minimap
  :config
  (setq minimap-mode t))

;; https://www.djcbsoftware.nl/code/mu/mu4e/Gmail-configuration.html
(require 'org-mu4e)  ;; required for capturing
(require 'smtpmail)  ;; required for sending email
(use-package mu4e
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

(use-package neotree
  :config
  (setq
   inhibit-compacting-font-caches t
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-smart-open t
   projectile-switch-project-action 'neotree-projectile-action
   neo-show-hidden-files t
   ))

(use-package powerthesaurus)

(use-package treemacs
  :disabled t   ;; requires hydra
  :config (treemacs))

;; try packages without installing them
;; (use-package try)

;; count words
(use-package wc-mode
  :disabled t  ;; breaks C-c C-w
  :hook
  (org-mode . wc-mode))

;; suggest keys
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

(provide 'packages)
;;; packages.el ends here
