(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'after-init-hook 'global-company-mode)
