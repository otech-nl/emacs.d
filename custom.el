;;; package --- customizations

;;; Commentary:
;; anything you can customize

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(column-number-mode t)
 '(completion-ignored-extensions
   (append completion-ignored-extensions
           (quote
            ("-lock.json"))))
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (whiteboard)))
 '(default-directory "~/src/" t)
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode t)
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(frame-title-format
   (quote
    ((:eval
      (if
          (buffer-file-name)
          (abbreviate-file-name
           (buffer-file-name))
        "%b")))) t)
 '(global-auto-revert-mode t)
 '(gnus-thread-sort-functions (quote ((not gnus-thread-sort-by-most-recent-number))))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (lambda nil (me/go-home) (get-buffer "*Org Agenda*")))
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/notes.org" "~/Dropbox/org/archive.org")))
 '(org-archive-location "~/Dropbox/org/archive.org::datetree/* %s")
 '(org-clock-auto-clock-resolution (quote when-no-clock-is-running))
 '(org-clock-clocktable-default-properties (quote (:maxlevel 2 :scope agenda :block lastmonth)))
 '(org-clock-history-length 10)
 '(org-clock-in-resume t)
 '(org-clock-into-drawer t)
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-columns t)
 '(org-default-notes-file "~/Dropbox/org/refile.org")
 '(org-directory "~/Dropbox/org/")
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-into-drawer t)
 '(org-pretty-entities t)
 '(org-publish-project-alist nil)
 '(org-refile-targets (quote ((org-agenda-files :level . 1))))
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(package-archive-priorities (quote (("ELPA" . 10) ("MELPA-stable" . 5) ("MELPA" . 0))))
 '(package-archives
   (quote
    (("ELPA" . "https://elpa.gnu.org/packages/")
     ("MELPA-stable" . "https://stable.melpa.org/packages/")
     ("MELPA" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (tide oauth2 wanderlust htmlize flycheck company auto-package-update use-package magit)))
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(smiley-style (quote medium))
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "steets@otech.nl")
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom)
;;; custom.el ends here
