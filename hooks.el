;;; package --- hooks

;;; Commentary:

;;; Code:

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
  ;; (add-hook 'text-mode-hook 'flyspell-mode)

(provide 'hooks)
;;; hooks.el ends here
