;;; filetypes --- support for specific file types

;;; Commentary:

;;; Code:

(use-package dockerfile-mode
  :ensure t
  :mode "^Dockerfile$")

(use-package elpy  ;; also use elpy-config
  :ensure t
  :hook (elpy-mode . (lambda () (highlight-indentation-mode -1)))
  :init
  (elpy-enable))

(use-package flycheck
  :diminish " ✓"
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package format-all
  :hook (prog-mode . format-all-mode))

(use-package gherkin-mode
  :defer t)

(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-odd-face-perc 15
        highlight-indent-guides-auto-even-face-perc 15
        highlight-indent-guides-auto-character-face-perc 20))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :defer t
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package pipenv
  :hook (python-mode . pipenv-mode))

(use-package prettier-js)

;; project interaction (https://docs.projectile.mx/)
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package rjsx-mode
  :mode ("\\.js\\'" "\\.jsx\\'")
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq js-indent-level 2))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package web-mode
  :mode ("\\.html$" "\\.mustache$" "\\.djhtml$" "\\.jinja2$" ))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup))

(use-package yaml-mode)

(provide 'filetypes)
;;; filetypes.el ends here
