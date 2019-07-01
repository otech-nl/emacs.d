;; PM only: packages I have considered, but didn't make it

(use-package all-the-icons)  ;; also: M-x all-the-icons-install-fonts

(use-package all-the-icons-ivy
  :ensure t
  :after all-the-icons
  :after ivy
  :config
  (all-the-icons-ivy-setup))

(use-package discover)

(use-package dumb-jump
  :ensure
  :config (setq dumb-jump-selector 'ivy)
  :bind (("M-C-o" . dumb-jump-go-other-window)
         ("M-C-j" . dumb-jump-go)
         ("M-C-i" . dumb-jump-go-prompt)
         ("M-C-x" . dumb-jump-go-prefer-external)
         ("M-C-z" . dumb-jump-go-prefer-external-other-window)))

(use-package ivy  ;; includes counsel and swiper
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x C-f" . 'counsel-find-file)
         )
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  :config (ivy-mode))

(use-package projectile
  :pin MELPA
  :config
  (projectile-global-mode +1)
  (setq projectile-enable-caching t)
  :bind-keymap
  ("M-p" . projectile-command-map)
  )

(use-package rainbow-mode
  :ensure
  :config
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package outshine
  :defer t)

(use-package winner
  :config (winner-mode 1)
  :defer t)
