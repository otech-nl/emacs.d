;;; package --- customizations

;;; Commentary:
;; anything you can customize

;;; Code:


(setq my/org-dir (cond ((eq system-type 'gnu/linux) "/media/steets/Shared/org/")
                       ((eq system-type 'windows-nt) "S:/org/" "")
                       ((eq system-type 'cygwin) "/cygdrive/s/org/" "")))

(defun my/org-path (path) (concat my/org-dir path))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(column-number-mode t)
 '(compilation-scroll-output (quote first-error))
 '(completion-ignored-extensions
   (append completion-ignored-extensions
           (quote
            ("-lock.json" ".pyc"))))
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (misterioso)))
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
 '(org-agenda-files (list (my/org-path "notes.org")))
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-archive-location (my/org-path "archive.org::datetree/* %s"))
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
 '(org-default-notes-file (my/org-path "notes.org"))
 '(org-default-priority 67)
 '(org-directory my/org-dir)
 '(org-duration-format (quote ((special . h:mm))))
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-directory "~/Dropbox/org/")
 '(org-mobile-inbox-for-pull (my/org-path "refile.org"))
 '(org-modules (quote (org-habit org-info org-mouse org-velocity)))
 '(org-pretty-entities t)
 '(org-publish-project-alist nil)
 '(org-refile-targets (quote ((my/org-path "notes.org") :level . 2)))
 '(org-refile-use-outline-path nil)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-support-shift-select t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "SOMEDAY(s)"))))
 '(org-use-speed-commands t)
 '(package-archive-priorities (quote (("ELPA" . 10) ("MELPA" . 5) ("MELPA-stable" . 0))))
 '(package-archives
   (quote
    (("ELPA" . "https://elpa.gnu.org/packages/")
     ("MELPA-stable" . "https://stable.melpa.org/packages/")
     ("MELPA" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (kivy-mode jinja2-mode gherkin-mode blacken prettier-js rjsx-mode htmlize elpy powerthesaurus neotree minimap company-lsp lsp-ui lsp-mode lsp-docker docker org-velocity god-mode diminish activity-watch-mode projectile writegood-mode magit which-key doom-modeline all-the-icons auto-package-update use-package)))
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
