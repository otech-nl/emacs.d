;;; ===========================================================
;;; packages

;; Emacs packages
(require 'mouse-copy)

;; external packaes
(package-initialize)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives   ;; https seems broken on windows
                 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t))

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
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode)))
(use-package jinja2-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.jinja?\\'" . web-mode)))
(use-package elpy  ;;; pip install jedi flake8 importmagic autopep8 yapf
  :after python
  :config (elpy-enable))
(use-package auto-complete
  :config (ac-config-default))
(use-package php-mode)
(use-package dockerfile-mode)
(use-package yaml-mode)
;; (use-package easykill)
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

;; no idea why I still have to do this...
(require 'crux)
