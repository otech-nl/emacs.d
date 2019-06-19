;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; bootstrap use-package (https://github.com/jwiegley/use-package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; the actual packages

(use-package draft-mode)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package guru-mode
  :config
    (guru-global-mode +1))

(use-package magit
  :bind (("C-x g" . magit-status)))  ;; default key binding fails...

(use-package markdown-mode
  :mode (("\\.text\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  )

(use-package org
  ;; :ensure org-plus-contrib
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  ;; (add-hook 'org-mode-hook 'flyspell-mode)
  ;; (setq org-mobile-directory (expand-file-name "org" steets:drive-root))
  :diminish visual-line-mode
  :diminish org-indent-mode
  :defer t
  :bind (("\C-c l" . org-store-link)
         ("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ("\C-c t" . (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
         ;; ((kbd "C-c b") 'org-switchb)
         ))

(use-package spaceline)

(use-package writeroom-mode
  :config
  (setq writeroom-width 120))
