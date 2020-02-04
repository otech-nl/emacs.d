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
 '(compilation-scroll-output (quote first-error))
 '(completion-ignored-extensions
   (append completion-ignored-extensions
           (quote
            ("-lock.json" ".pyc"))))
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
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice
   (lambda nil
     (org-agenda-list 1)
     (delete-other-windows)
     (get-buffer "*Org Agenda*")))
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(midnight-mode t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(org-agenda-files (quote ("~/src/org/notes.org")))
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-archive-location "~/src/org/archive.org::datetree/* %s")
 '(org-catch-invisible-edits (quote show))
 '(org-clock-auto-clock-resolution (quote when-no-clock-is-running))
 '(org-clock-clocktable-default-properties (quote (:maxlevel 2 :scope agenda :block lastmonth)))
 '(org-clock-history-length 10)
 '(org-clock-in-resume t)
 '(org-clock-into-drawer t)
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-columns t)
 '(org-default-notes-file "~/src/org/notes.org")
 '(org-default-priority 67)
 '(org-directory "~/src/org/")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-directory "~/Dropbox/org/")
 '(org-mobile-inbox-for-pull "~/src/org/refile.org")
 '(org-pretty-entities t)
 '(org-publish-project-alist nil)
 '(org-refile-targets
   (quote
    (("~/src/dwim/posts/index.org" :level . 0)
     ("~/src/org/notes.org" :level . 1))))
 '(org-refile-use-outline-path (quote full-file-path))
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "SOMEDAY(s)"))))
 '(package-archive-priorities (quote (("ELPA" . 10) ("MELPA" . 5) ("MELPA-stable" . 0))))
 '(package-archives
   (quote
    (("ELPA" . "https://elpa.gnu.org/packages/")
     ("MELPA-stable" . "https://stable.melpa.org/packages/")
     ("MELPA" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (projectile prettier-js writegood-mode captain htmlize yaml-mode web-mode tide rjsx-mode pipenv markdown-mode magit highlight-indent-guides gherkin-mode format-all flycheck elpy dockerfile-mode which-key doom-modeline all-the-icons auto-package-update use-package)))
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "steets@otech.nl")
 '(visible-bell t)
 '(whitespace-line-column 100)
 '(whitespace-style (quote (trailing lines-tail empty indentation::space))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom)
;;; custom.el ends here
