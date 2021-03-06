;;; package --- customizations

;;; Commentary:
;; anything you can customize

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(backup-directory-alist '(("." . "~/.emacs.d/backup")))
 '(blink-cursor-blinks 0)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(compilation-scroll-output 'first-error)
 '(completion-ignored-extensions
   (append completion-ignored-extensions
           '("-lock.json" ".pyc")))
 '(confirm-kill-processes nil)
 '(create-lockfiles nil)
 '(custom-enabled-themes '(misterioso))
 '(default-directory "~/src/" t)
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode t)
 '(dired-dwim-target 'dired-dwim-target-next-visible)
 '(dired-listing-switches "-ahl")
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(format-all-default-formatters
   '(("C" astyle)
     ("C#" astyle)
     ("C++" astyle)
     ("CSS" prettier)
     ("Dockerfile" dockfmt)
     ("Emacs Lisp" emacs-lisp)
     ("GraphQL" prettier)
     ("HTML" html-tidy)
     ("Java" astyle)
     ("JavaScript" prettier)
     ("JSON" prettier)
     ("JSX" prettier)
     ("Markdown" prettier)
     ("Nix" nixpkgs-fmt)
     ("Perl" perltidy)
     ("PHP" prettier)
     ("Python" black)
     ("Shell" shfmt)
     ("SQL" sqlformat)
     ("TypeScript" prettier)
     ("Vue" prettier)
     ("XML" html-tidy)
     ("YAML" prettier)
     ("_Angular" prettier)
     ("_Flow" prettier)
     ))
 '(frame-title-format
   '((:eval
      (if
          (buffer-file-name)
          (abbreviate-file-name
           (buffer-file-name))
        "%b"))) t)
 '(fringe-mode '(1 . 1) nil (fringe))
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(history-delete-duplicates t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js-indent-level 2)
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(midnight-mode t)
 '(mouse-avoidance-mode 'animate nil (avoid))
 '(org-agenda-files (list (steets/org-path "notes.org")))
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-catch-invisible-edits 'show)
 '(org-clock-auto-clock-resolution 'when-no-clock-is-running)
 '(org-clock-clocktable-default-properties '(:maxlevel 2 :scope agenda :block lastmonth))
 '(org-clock-history-length 10)
 '(org-clock-in-resume t)
 '(org-clock-into-drawer t)
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-columns t)
 '(org-default-notes-file (steets/org-path "notes.org"))
 '(org-directory steets/org-dir)
 '(org-duration-format '((special . h:mm)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-done 'time)
 '(org-log-into-drawer t)
 '(org-mobile-directory steets/org-dir)
 '(org-mobile-inbox-for-pull (steets/org-path "refile.org"))
 '(org-modules '(org-mouse))
 '(org-pretty-entities t)
 '(org-priority-default 67)
 '(org-publish-project-alist nil)
 '(org-refile-targets '((org-agenda-files :level . 2)))
 '(org-refile-use-outline-path nil)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-support-shift-select t)
 '(org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "SOMEDAY(s)")))
 '(org-use-speed-commands t)
 '(require-final-newline t)
 '(ring-bell-function 'ignore)
 '(safe-local-variable-values '((flycheck-disabled-checkers emacs-lisp-checkdoc)))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-always-indent 'complete)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "steets@otech.nl")
 '(visible-bell t)
 '(whitespace-line-column 100)
 '(whitespace-style '(trailing lines-tail empty indentation::space))
 '(x-stretch-cursor t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom)
;;; custom.el ends here
