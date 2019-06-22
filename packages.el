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

(use-package company
  :defer t)

(use-package deft
  :defer t)

(use-package draft-mode
  :defer t)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package gherkin-mode
  :defer t)

(use-package magit
  :bind (("C-x g" . magit-status)))  ;; default key binding fails...

(use-package markdown-mode
  :defer t
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  )

(use-package org
  ;; :ensure org-plus-contrib
  :ensure htmlize
  :init
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
  :pin melpa
  :config
  (projectile-global-mode +1)
  (setq projectile-enable-caching t)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package telephone-line
  :init
  (telephone-line-mode 1))

(use-package web-mode
  :mode ("\\.html$" "\\.jinja2$" "\\.mustache$" "\\.djhtml$" ))

(use-package winner
  :defer t)

(use-package writeroom-mode
  :defer t
  :config
  (setq writeroom-width 120))
