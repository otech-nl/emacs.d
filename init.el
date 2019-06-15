;;; My Emacs init file


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst steets:src-root
  (if (eq system-type 'windows-nt)
      "c:/Users/rene/src/"
    "~/src/")
  "Directory with all my sources")
(defconst steets:drive-root
 (if (eq system-type 'windows-nt)
     "C:/Users/rene/Dropbox"
   "~/Dropbox"))

;; handle config files
(let ((config-files
       (mapcar
        (lambda (f) (expand-file-name (concat f ".el") user-emacs-directory))
        (list "custom" "functions" "hooks" "packages" "org-cfg" "keys"))))
  ;; keep custom file separate
  (setq custom-file (car config-files))
  ;; load config files
  (dolist (f config-files)(load f)))

;;; ===========================================================
;;; odd & ends

(setq default-directory steets:src-root)

(display-time)

(set-language-environment "UTF-8")

(fset 'yes-or-no-p 'y-or-n-p)

(when (eq system-type 'windows-nt)
    (progn
      (add-to-list 'exec-path "C:/Program Files/Git/bin/")
      (setq ispell-program-name "c:/ProgramData/chocolatey/bin/hunspell")
      (setq ispell-dictionary "american")))

;; (setq ispell-program-name "aspell" ; use aspell instead of ispell
;;       ispell-extra-args '("--sug-mode=ultra"))

(if (display-graphic-p)
    (setq initial-frame-alist
          '((left . 20)
            (top . 20)
            (width . 100)
            (height . 43)))
            ;; (alpha . (100 . 75))))
  (setq initial-frame-alist '( (tool-bar-lines . 0))))
(setq default-frame-alist initial-frame-alist)

;; (put 'narrow-to-region 'disabled nil)

;;; ===========================================================
