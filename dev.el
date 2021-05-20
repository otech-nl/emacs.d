;;; dev --- support for software development

;;; Commentary:

;;; Code:

;; The Uncompromising Python Code Formatter
;; https://github.com/psf/black
(use-package blacken
  :config
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package docker)
(use-package docker-compose-mode)
(use-package dockerfile-mode
  :mode "^Dockerfile$")

(use-package gherkin-mode
  :defer t)

(use-package jinja2-mode
  :mode ("\\.mustache$" "\\.djhtml$" "\\.jinja2$" ))

;; language server protocol
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "C-c h")
  :hook ((python-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (js-mode . lsp)
         (typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-position 'at-point
        lsp-ui-flycheck-enable t))

(use-package lsp-python-ms
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

;; A Git Porcelain inside Emacs
;; https://magit.vc/
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package markdown-mode
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

(use-package prettier-js
  :init
  (add-hook 'json-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
)
(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  (add-hook 'before-save-hook #'whitespace-cleanup))

(provide 'dev)
;;; dev.el ends here
