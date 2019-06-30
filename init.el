;;; package --- main init file

;;; Commentary:
;; mainly to load other config files

;;; Code:

;; handle config files
(let ((config-files
       (mapcar
        (lambda (f) (expand-file-name (concat f ".el") user-emacs-directory))
        (list "custom" "hooks" "functions" "org-cfg" "packages" "keys"))))
  ;; keep custom file separate
  (setq custom-file (car config-files))
  ;; load config files
  (dolist (f config-files)
    (progn
      (message "Loaded %s %s" f (load f)))))

;;; odd & ends

;; (cua-mode t)

(display-time)

(set-language-environment "UTF-8")

(fset 'yes-or-no-p 'y-or-n-p)

(require 'dired-x)

(setq completion-ignored-extensions
      (append completion-ignored-extensions
              '("-lock.json")))

(provide 'init)
;;; init.el ends here
