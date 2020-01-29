;;; filetypes --- support for specific file types

;;; Commentary:

;;; Code:

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

;; (use-package anaconda-mode  ;; includes pipenv
;;   ;; consider https://github.com/pythonic-emacs/company-anaconda
;;   :defer t
;;   :hook python-mode
;;   :hook (python-mode . anaconda-eldoc-mode))

;; (use-package company-anaconda
;;   :config (add-to-list 'company-backends 'company-anaconda))

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
