(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (misterioso)))
 '(default-directory "~/src" t)
 '(delete-selection-mode t)
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice
   (lambda nil
     (org-todo-list 1)
     (delete-other-windows)
     (get-buffer "*Org Agenda*")))
 '(kill-whole-line t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/work.org" "~/Dropbox/org/administratie.org" "~/Dropbox/org/refile.org")))
 '(org-columns t)
 '(org-default-notes-file "~/Dropbox/org/refile.org")
 '(org-directory "~/Dropbox/org/")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-into-drawer t)
 '(org-pretty-entities t)
 '(org-refile-targets
   (quote
    (("archive.org" :maxlevel . 1)
     ("work.org" :maxlevel . 1)
     ("sysop.org" :maxlevel . 1))))
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-todo-keywords
   (quote
    ((sequence "TODO(t)" "WIP(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)"))))
 '(package-selected-packages
   (quote
    (spaceline guru-mode writeroom-mode write-room draft-mode gherkin-mode company markdown-mode auto-package-update use-package magit)))
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "rene@steets.nl"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
