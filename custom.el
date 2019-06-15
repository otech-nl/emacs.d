;;; ===========================================================
;;; customizations

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(column-number-mode t)
 '(create-lockfiles nil)
 '(custom-enabled-themes (quote (misterioso)))
 '(default-directory steets:src-root t)
 '(delete-selection-mode t)
 '(display-time-24hr-format t)
 '(electric-pair-mode t)
 '(elpy-rpc-python-command "python3")
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-default-notes-file (expand-file-name "org/refile.org" steets:drive-root))
 '(org-directory (expand-file-name "org/" steets:drive-root))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-pretty-entities t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-use-sub-superscripts (quote {}))
 '(package-enable-at-startup t)
 '(package-selected-packages
   (quote
    (org-bullets mustache-mode org-plus-contrib org2web feature-mode ox-epub ox-rss wc-mode flycheck captain htmlize easy-kill exec-path-from-shell crux auto-package-update easykill web-mode jinja2-mode use-package php-mode dockerfile-mode yaml-mode markdown-mode auto-complete magit)))
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "steets@steets.nl")
 '(whitespace-style
   (quote
    (face trailing tabs lines-tail empty space-after-tab space-before-tab))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
