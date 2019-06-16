;;; ===========================================================
;;; packages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives   ;; https seems broken on windows
                 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t))

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless ;; (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

;;; ===========================================================
;;; packages

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
 ;; '(global-hl-line-mode 1)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (lambda ()
    (org-todo-list 1)
    (delete-other-windows)
    (get-buffer "*Org Agenda*")))
 '(kill-whole-line t)
 '(org-agenda-files (quote ("~/Dropbox/org/work.org" "~/Dropbox/org/administratie.org" "~/Dropbox/org/refile.org")))
 '(org-columns t)
 '(org-default-notes-file "~/Dropbox/org/refile.org")
 '(org-directory "~/Dropbox/org/")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-log-into-drawer t)
 '(org-pretty-entities t)
 '(org-startup-folded nil)
 '(org-startup-indented t)
 '(org-startup-with-inline-images t)
 '(org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))
 '(package-selected-packages (quote (auto-complete magit)))
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

(display-time)

(set-language-environment "UTF-8")

(fset 'yes-or-no-p 'y-or-n-p)

(ac-config-default)

;;;; ===========================================================
;;; hooks

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
;; (add-hook 'after-init-hook 'org-agenda-list)

;; ===========================================================
;;; key bindings (C-c for user keys)

(global-set-key (kbd "C-c /")  ; (un)comment line or region
                (lambda () (interactive)
                  (if (region-active-p)
                      (comment-or-uncomment-region (region-beginning) (region-end))
                    (comment-or-uncomment-region
                     (line-beginning-position) (line-end-position)))))
(global-set-key (kbd "C-c b") 'eval-buffer)
(global-set-key (kbd "C-c d")  ; duplicate line
                (lambda () (interactive)
                  (save-excursion
                    (let ((kill-read-only-ok t) deactivate-mark)
                      (toggle-read-only 1) (kill-whole-line) (toggle-read-only 0) (yank)))))
(global-set-key (kbd "C-c C-f")  ; find org file
                (lambda() (interactive)
                  (find-file (read-file-name "Find file: " org-directory))))
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c n") (lambda () (interactive) (find-file "~/src/notes/")))
(global-set-key (kbd "C-c p") 'package-list-packages)
(global-set-key (kbd "C-c r") (lambda () (interactive) (find-file "~/Dropbox/org/refile.org")))
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c t") (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
(global-set-key (kbd "C-c w") (lambda () (interactive) (find-file "~/Dropbox/org/work.org")))
(global-set-key (kbd "C-x g") 'magit-status)  ;; default key binding fails...
(global-set-key (kbd "C-x k") 'kill-this-buffer)  ;; override

(global-set-key (kbd "C-c <up>")
                (lambda () (interactive)
                  (transpose-lines 1) (forward-line -2) (indent-according-to-mode)))

(global-set-key (kbd "C-c <down>")
                (lambda () (interactive)
                  (forward-line 1) (transpose-lines 1) (forward-line -1)
                  (indent-according-to-mode)))
;;; ===========================================================
;;; Org-mode

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
                                        ;(global-set-key (kbd "C-c b") 'org-switchb)

(setq org-capture-templates
      `(("t" "todo" entry (file "~/Dropbox/org/refile.org") "* TODO %?\n%U\n%a")

        ("n" "note" entry (file "~/Dropbox/org/refile.org") "* %? :NOTE:\n%U\n%a")

        ("m" "meeting" entry (file "~/Dropbox/org/refile.org") "* MEETING with %? :MEETING:\n%U")

        ("h" "habit" entry (file "~/Dropbox/org/refile.org") "* NEXT %?\n%U\n%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")))
