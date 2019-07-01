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
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(default-directory "~/src/" t)
 '(deft-directory "~/src/blog/")
 '(deft-extensions (quote ("org" "txt" "text" "md" "markdown")))
 '(deft-recursive t)
 '(delete-by-moving-to-trash t)
 '(delete-selection-mode t)
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice
   (lambda nil
     (org-todo-list 1)
     (delete-other-windows)
     (get-buffer "*Org Agenda*")))
 '(kill-whole-line t)
 '(load-prefer-newer t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/work.org" "~/Dropbox/org/administratie.org" "~/Dropbox/org/refile.org")))
 '(org-clock-auto-clock-resolution (quote when-no-clock-is-running))
 '(org-clock-history-length 10)
 '(org-clock-in-resume t)
 '(org-clock-into-drawer t)
 '(org-clock-persist t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-columns t)
 '(org-default-notes-file "~/Dropbox/org/refile.org")
 '(org-directory "~/Dropbox/org/")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-into-drawer t)
 '(org-pretty-entities t)
 '(org-publish-project-alist nil)
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
 '(package-archive-priorities (quote (("ELPA" . 10) ("MELPA-stable" . 5) ("MELPA" . 0))))
 '(package-archives
   (quote
    (("ELPA" . "https://elpa.gnu.org/packages/")
     ("MELPA-stable" . "https://stable.melpa.org/packages/")
     ("MELPA" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (dap-javascript dap-python dap-mode company-lsp lsp-ui lsp-mode format-all ranger rainbow-mode ws-butler whole-line-or-region counsel discover anaconda-mode prettier-js rjsx-mode yaml-mode typescript-mode smooth-scrolling writeroom-mode which-key web-mode use-package telephone-line smart-mode-line projectile pipenv outshine markdown-mode magit jinja2-mode htmlize gherkin-mode flycheck expand-region elpy dumb-jump draft-mode deft captain blog-admin auto-package-update)))
 '(projectile-project-search-path "~/src/")
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "rene@steets.nl")
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'custom)
;;; custom.el ends here
