;;; ===========================================================
;;; hooks & stuff

(add-to-list 'auto-mode-alist '("\\.mustache\\'" . mustache-mode))
;; (add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
(add-hook 'text-mode-hook 'steets:text-mode-settings)
(add-hook 'web-mode-hook 'steets:text-mode-settings)
(add-hook 'prog-mode-hook 'steets:prog-mode-settings)
