;;; ===========================================================
;;; packages

;; Emacs packages
(require 'mouse-copy)

;; external packaes (other possible sources are elpa and marmalade)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'load-path (expand-file-name "elpa" user-emacs-directory))

;; bootstrap use-package (https://github.com/jwiegley/use-package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; configure use-package
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; my packages
(use-package crux
  :defer nil)
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))
(use-package markdown-mode
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  )
;; (use-package flyspell)
(use-package org
  ;; :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  ;; (add-hook 'org-mode-hook 'flyspell-mode)
  (setq org-mobile-directory (expand-file-name "org" steets:drive-root))
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ("\C-c l" . org-store-link)))
;; (use-package org-bullets
;;   :init
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package mustache)
(use-package ht)
(use-package org2web)

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode)))
(use-package jinja2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.jinja?\\'" . web-mode)))
;; (use-package elpy  ;;; pip install jedi flake8 importmagic autopep8 yapf
;;   :after python
;;   :config (elpy-enable))
(use-package auto-complete
  :config (ac-config-default))
(use-package php-mode)
(use-package dockerfile-mode)
(use-package yaml-mode)
(use-package easy-kill
  :config
  (global-set-key [remap kill-ring-save] #'easy-kill)
  (global-set-key [remap mark-sexp] #'easy-mark))
(use-package magit
  :bind (("C-x g" . magit-status)))  ;; default key binding fails...
(use-package htmlize)
(use-package captain
  :config
  (add-hook
   'org-mode-hook
   (lambda ()
     (setq captain-predicate
           (lambda () (not (org-in-src-block-p)))))))
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))
(use-package wc-mode
  :config
  (add-hook 'text-mode-hook 'steets:text-mode-settings))

;; no idea why I still have to do this...
(require 'crux)


;; local libs
(add-to-list 'load-path (concat user-emacs-directory "contrib"))
(require 'ox-rss)
(require 'ox-epub)
