;;; filetypes --- support for specific file types

;;; Commentary:

;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package elpy  ;; also use elpy-config
  :ensure t
  :init
  (elpy-enable))

(use-package format-all
  :hook (prog-mode . format-all-mode))

(use-package gherkin-mode
  :defer t)

(use-package markdown-mode
  :defer t
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode)))

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
  :mode ("\\.html$" "\\.mustache$" "\\.djhtml$" ))

(use-package yaml-mode)

(provide 'filetypes)
;;; filetypes.el ends here
