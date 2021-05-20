;;; package --- main init file

;;; Commentary:
;; mainly to load other config files

;;; Code:

;; handle config files
(let ((config-files
       (mapcar
        (lambda (f) (expand-file-name (concat f ".el") user-emacs-directory))
        (list "custom" "hooks" "me" "packages" "dev" "org-cfg" "keys"))))
  ;; keep custom file separate
  (setq custom-file (car config-files))
  ;; load config files
  (dolist (f config-files)
    (progn
      (message "Loaded %s %s" f (load f)))))

;; try this for literate init
;; (org-babel-load-file (expand-file-name "~/.emacs.d/init.org"))

;;; odd & ends

;; (cua-mode t)

(display-time)

(set-language-environment "UTF-8")

(fset 'yes-or-no-p 'y-or-n-p)

(put 'narrow-to-region 'disabled nil)

(find-file (my/org-path "notes.org"))

(provide 'init)
;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
