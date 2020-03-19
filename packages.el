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
(setq use-package-always-ensure t
      use-package-always-defer nil)

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; actual packages

(use-package activity-watch-mode
  :config
  (global-activity-watch-mode))

;; silversearcher (https://agel.readthedocs.io/, https://geoff.greer.fm/ag/)
(use-package ag
  :disabled t  ;; feels clunky
  :commands (ag ag-regexp ag-project)
  :config
  (setq ag-highlight-search t
        ag-reuse-buffers 't)
  )

;; pretty icons (needed by several other packages)
(use-package all-the-icons)

;; flashes the cursor's line when you scroll
(use-package beacon
  :disabled t  ;; annoying
  :config (beacon-mode 1)
  ;; (setq beacon-color "#666600")
  )

;; complete anything (https://company-mode.github.io/)
(use-package company)

;; counsel adds suggestions in the minibuffer with M-o
;; swiper replaces isearch
;; ivy is a completion framework
(use-package counsel  ;; counsel depends on swiper, which depends on ivy
  :disabled t  ;; elpy depends on company
  :config
  ;; ivy
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t)

  ;; swiper
  (global-set-key "\C-s" 'swiper)

  ;; counsel
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c a") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package diminish)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode))

;; spell checking text modes and code comments
(use-package flyspell
  :init
  (setq ispell-program-name "aspell"
        ispell-list-command "--list")
  :config
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;; fix mouse
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
  (define-key flyspell-mouse-map [mouse-3] #'undefined))

;; https://github.com/chrisdone/god-mode
(use-package god-mode
  :bind ("<escape>" . god-mode-all)
  :config
  (setq me/mode-line-background (face-background 'mode-line)
        me/mode-line-background-inactive (face-background 'mode-line-inactive))
  (define-key god-local-mode-map (kbd ".") 'repeat)
  (add-hook 'god-mode-enabled-hook 'me/god-mode-line)
  (add-hook 'god-mode-disabled-hook 'me/god-mode-line))

(use-package minimap
  :config
  (setq minimap-mode t))

(use-package neotree
  :config
  (setq
   inhibit-compacting-font-caches t
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-smart-open t
   projectile-switch-project-action 'neotree-projectile-action
   neo-show-hidden-files t
   ))

(use-package powerthesaurus)

(use-package treemacs
  :disabled t   ;; requires hydra
  :config (treemacs))

;; try packages without installing them
;; (use-package try)

;; count words
(use-package wc-mode
  :disabled t  ;; breaks C-c C-w
  :hook
  (org-mode . wc-mode))

;; suggest keys
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

;; http://joaotavora.github.io/yasnippet/
(use-package yasnippet
  :disabled t  ;; too complex
  :diminish yas-minor-mode
  :config
  (use-package yasnippet-snippets)
  (yas-global-mode 1)
  )

(provide 'packages)
;;; packages.el ends here
