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
(setq use-package-always-ensure t)
(setq use-package-always-defer nil)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; actual packages

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this like to restore defaults
  (define-auto-insert '(org-mode . "org-mode file")
    '("org-mode header"
      "#+TITLE: " (file-name-base (buffer-file-name)) \n
      "#+DATE: " (format-time-string "%Y-%m-%d") \n
      \n
 )))

(use-package captain
  :config
  (add-hook
   'org-mode-hook
   (lambda ()
     (setq captain-predicate
           (lambda () (not (org-in-src-block-p)))))))

(use-package company
  :defer t)

(use-package deft
  :defer t)

(use-package draft-mode
  :defer t)

(use-package dumb-jump
  :ensure
  :config (setq dumb-jump-selector 'ivy)
  :bind (("M-C-o" . dumb-jump-go-other-window)
         ("M-C-j" . dumb-jump-go)
         ("M-C-i" . dumb-jump-go-prompt)
         ("M-C-x" . dumb-jump-go-prefer-external)
         ("M-C-z" . dumb-jump-go-prefer-external-other-window)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package flyspell
  :init
  (setq ispell-program-name "aspell")
  (setq ispell-list-command "--list")
  :config
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode))

(use-package gherkin-mode
  :defer t)

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :bind
  (:map ivy-mode-map ("C-'" . ivy-avy))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-height 10)  ;; number of result lines to display
  (setq ivy-count-format "")  ;; does not count candidates
  (setq ivy-initial-inputs-alist nil)  ;; no regexp by default
  (setq ivy-re-builders-alist  ;; configure regexp engine.
        '((t . ivy--regex-ignore-order)))) ;; allow input not in order

(use-package jinja2-mode)

(use-package magit
  :bind (("C-x g" . magit-status)))  ;; default key binding fails...

(use-package markdown-mode
  :defer t
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package org
  ;; :ensure org-plus-contrib
  :ensure htmlize
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (org-clock-persistence-insinuate)
  ;; (setq org-mobile-directory (expand-file-name "org" steets:drive-root))
  :bind (("\C-c l" . org-store-link)
         ("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ("\C-c t" . (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
         ;; ("\C-c b" . org-switchb)
         ))

(use-package outshine
  :defer t)

(use-package projectile
  :pin MELPA
  :config
  (projectile-global-mode +1)
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("M-p" . projectile-command-map)
  )

(use-package pipenv
  :hook (python-mode . pipenv-mode))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(use-package telephone-line
  :config
  (telephone-line-mode 1))

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode)))

(use-package web-mode
  :mode ("\\.html$" "\\.js$" "\\.jsx$" "\\.jinja2$" "\\.mustache$" "\\.djhtml$" ))

(use-package which-key
  :config (which-key-mode))

(use-package winner
  :config (winner-mode 1)
  :defer t)

(use-package writeroom-mode
  :defer t
  :config
  (setq writeroom-width 120))

(use-package yaml-mode)

(provide 'packages)
;;; packages.el ends here
