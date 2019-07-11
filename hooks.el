;;; package --- hooks

;;; Commentary:

;;; Code:

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'outline-minor-mode)
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; (add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook
          (lambda ()
            ;; file modification date
            (set (make-local-variable 'time-stamp-format) "%:y-%02m-%02d")
            (set (make-local-variable 'time-stamp-start) "^#\\+DATE: +")
            (set (make-local-variable 'time-stamp-end) "$")

            ;; Switch language for Org file, if a `#+LANGUAGE:' meta-tag is on top 14 lines.
            (save-excursion
              (goto-line 15)
              (if (re-search-backward "#\\+LANGUAGE: +\\([A-Za-z_]*\\)" 1 t)
                  (ispell-change-dictionary (match-string 1))))))

(provide 'hooks)
;;; hooks.el ends here
