;;; filetypes --- support for specific file types

;;; Commentary:

;;; Code:

(use-package blacken
  :config
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package docker)

(use-package dockerfile-mode
  :disabled t  ;; trying LSP
  :mode "^Dockerfile$")

(use-package elpy  ;; also use elpy-config
  :disabled t  ;; trying LSP
  :hook (elpy-mode . (lambda () (highlight-indentation-mode -1)))
  :init
  (elpy-enable))

(use-package flycheck
  :disabled t  ;; use tools like prettier-js and black
  :diminish " ✓"
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package gherkin-mode
  :defer t)

(use-package highlight-indent-guides
  :disabled t  ;; trying LSP
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-odd-face-perc 15
        highlight-indent-guides-auto-even-face-perc 15
        highlight-indent-guides-auto-character-face-perc 20))

(use-package jinja2-mode
  :mode ("\\.mustache$" "\\.djhtml$" "\\.jinja2$" ))

;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "C-c h")
  :hook ((python-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (js-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-position 'at-point
        lsp-ui-flycheck-enable t))

(use-package company-lsp
  :requires company
  :commands company-lsp
  :config (push 'company-lsp company-backends))

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-python)
;; (use-package dap-javascript)

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package pipenv
  :disabled t  ;; trying LSP
  :hook (python-mode . pipenv-mode))

(use-package prettier-js
  :config
  (add-hook 'json-mode-hook 'prettier-js-mode)
)

;; project interaction (https://docs.projectile.mx/)
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package rjsx-mode
  :mode ("\\.js\\'" "\\.jsx\\'" "\\.ts\\'" "\\.tsx\\'")
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq js-indent-level 2))

(use-package tide
  :disabled t  ;; I don't seem to use it
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package web-mode
  :disabled t  ;; trying LSP
  :mode ("\\.html$"))

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup))

(use-package yaml-mode
  :disabled t  ;; trying LSP
  )

(provide 'filetypes)
;;; filetypes.el ends here
