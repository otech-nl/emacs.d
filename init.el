;;; My Emacs init file

;;; ===========================================================
;;; customizations

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(default-directory "s:/src/" t)
 '(delete-selection-mode t)
 '(display-time-24hr-format t)
 '(display-time-mode t)
 '(global-auto-revert-mode t)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(org-default-notes-file "~/.emacs.d/org/notes.org")
 '(org-directory "~/.emacs.d/org")
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-pretty-entities t)
 '(org-startup-folded nil)
 '(org-startup-with-inline-images t)
 '(package-selected-packages (quote (magit htmlize crux)))
 '(require-final-newline t)
 '(ring-bell-function (quote ignore))
 '(save-place-mode t)
 '(savehist-mode t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(user-full-name "René Steetskamp")
 '(user-mail-address "steets@steets.nl"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; ===========================================================
;;; packages

;; auto-complete
;; ac-html
;; crux
;; feature-mode
;; htmlize
;; jinja2-mode
;; markdown-mode  ;; takes very long
;; php-mode
;; py-autopep8
;; python
;; pyvenv
;; wc-mode
;; web-mode

(defun require-packages (packages &optional check_install)
  "Require packages and optionally install them"
  (dolist (p packages)
    (message "Activating package %s" p)
    (if (and check_install (not (package-installed-p p)))
        (package-install p))
    (require p)))

;; Emacs packages
(require-packages '(mouse-copy))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives   ;; https seems broken on windows
                 '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/") t))

(require-packages package-selected-packages t)

(add-to-list 'load-path "~/.emacs.d/site")
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
;; (ac-config-default) ;; do this once


;;; ===========================================================
;;; functions

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
          (auto-complete-mode 1)))

(defun text-mode-settings ()
  "custom settings for text-based modes"
  (turn-on-visual-line-mode)
  (setq-local whitespace-line-column 999))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive)
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region        ;Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
          (insert text))))
    (if use-region nil                  ;Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n)                             ;Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

;;; ===========================================================
;;; key bindings (C-c for user keys)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-line-or-region) ;; custom function
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c e") 'crux-find-user-init-file)
(global-set-key (kbd "C-c e") 'crux-find-user-init-file)
(global-set-key (kbd "C-c S") 'crux-find-shell-init-file)
(global-set-key (kbd "C-c d") 'duplicate-line-or-region)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))  ;; join with next line
(global-set-key (kbd "C-c l") 'package-list-packages)
(global-set-key (kbd "C-c o") 'sort-lines)
;; (global-set-key (kbd "C-c r") 'crux-rename-buffer-and-file)
(global-set-key (kbd "C-c r") 'remember)
(global-set-key (kbd "C-c R") 'remember-region)
(global-set-key (kbd "C-c s") 'crux-swap-windows)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c u") (lambda () (interactive) (revert-buffer-with-coding-system "unix")))
(global-set-key (kbd "C-x k") 'kill-this-buffer)  ;; override
(global-set-key [(control shift down)] 'move-text-down)
(global-set-key [(control shift return)] 'crux-smart-open-line-above)
(global-set-key [(control shift up)] 'move-text-up)
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)
(global-set-key [(shift return)] 'crux-smart-open-line)

;; (define-key key-translation-map (kbd "<s-mouse-1>") (kbd "<mouse-2>"))
(global-set-key [remap kill-whole-line] 'crux-kill-whole-line)

;;; ===========================================================
;;; hooks & stuff

;; (add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
(add-hook 'text-mode-hook 'text-mode-settings)
(add-hook 'text-mode-hook 'wc-mode)
(add-hook 'web-mode-hook 'text-mode-settings)

(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . jinja2-mode))


;;; ===========================================================
;;; odd & ends

(display-time)

(set-language-environment "UTF-8")

;; (defalias 'list-buffers 'ibuffer) ; always use ibuffer

(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(fset 'yes-or-no-p 'y-or-n-p)

(if (eq system-type 'windows-nt)
    (progn
      (add-to-list 'exec-path "C:/Program Files/Git/bin/")
      (setq ispell-program-name "c:/ProgramData/chocolatey/bin/hunspell")
      (setq ispell-dictionary "american")
      (custom-set-variables '(default-directory "s:/src/" t))
      )
  (custom-set-variables '(default-directory "s:/src/" t))
  )

(if window-system
    (progn
      (if (> (x-display-pixel-width) 1280)
          (add-to-list 'default-frame-alist (cons 'width 120))
        (add-to-list 'default-frame-alist (cons 'width 80)))
      (add-to-list 'default-frame-alist
                   (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height)))))
  )

(put 'narrow-to-region 'disabled nil)

;;; ===========================================================
