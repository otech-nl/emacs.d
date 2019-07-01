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

(use-package anaconda-mode  ;; includes pipenv
  :defer t
  :hook python-mode
  :hook (python-mode . eldoc-mode))

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this to restore defaults
  (define-auto-insert '(org-mode . "org-mode file")
    '("org-mode header"
      "#+TITLE: " (file-name-base (buffer-file-name)) \n
      "#+DATE: " (format-time-string "%Y-%m-%d") \n
      \n
      )))

(use-package captain
  :defer t
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

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package format-all
  :hook (prog-mode . format-all-mode))
;; also: pip install black
;; also: npm i --global prettier

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

;; not stable yet
;; (use-package lsp-mode
;;   :hook (prog-mode . lsp)
;;   :commands lsp
;;   :config
;;   (use-package lsp-ui :commands lsp-ui-mode)
;;   (use-package company-lsp :commands company-lsp)
;;   (use-package dap-mode
;;     :hook ((prog-mode . dap-mode) (prog-mode . dap-ui-mode))
;;     :config
;;     (require 'dap-python)))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :defer t
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package org
  :ensure htmlize
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (org-clock-persistence-insinuate)
  :bind (("\C-c l" . org-store-link)
         ("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ("\C-c t" . (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
         ;; ("\C-c b" . org-switchb)
         ))

(use-package ranger
  :config (ranger-override-dired-mode t))

(use-package rjsx-mode
  :mode ("\\.js\\'" "\\.jsx\\'")
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq js-indent-level 2))

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1))

(use-package telephone-line
  :config
  (telephone-line-mode 1))

(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.tsx\\'"))

(use-package web-mode
  :mode ("\\.html$" "\\.jinja2$" "\\.mustache$" "\\.djhtml$" ))

(use-package which-key
  :config (which-key-mode))

(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-mode
  :config
  (whole-line-or-region-mode 1))

(use-package writeroom-mode
  :defer t
  :config
  (setq writeroom-width 120))

(use-package ws-butler  ;; clean up whitespace
  :ensure t
  :diminish ws-butler-mode
  :config
  (add-hook 'prog-mode-hook 'ws-butler-mode)
  (add-hook 'jinja2-mode-hook 'ws-butler-mode)
  (add-hook 'yaml-mode-hook 'ws-butler-mode))

(use-package yaml-mode)

(provide 'packages)
;;; packages.el ends here
