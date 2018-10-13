;; ====================================
;; Packages

(setq repository-packages
      '(
        auto-complete
        ac-html
        feature-mode
        markdown-mode
        php-mode
        py-autopep8
        python
        pyvenv
        sphinx-mode
        tide
        wc-mode
        web-mode
        ;; elpy ;; emmet-mode ;; magit ;; jedi ;; projectile ;; pungi ;; smart-line-mode
        ;; smart-tabs-mode ;; typescript-mode
        ))
(setq standard-packages
      '(
        mouse-copy
        dired-x
        iso-transl
        python
        ))

(defun require-list (packages)
  (dolist (p packages)
    (progn
      (message "Installing package %s" p)
      (require p))))

(defun uninstalled-packages (packages)
  (delq nil
    (mapcar (lambda (p) (if (package-installed-p p nil) nil p)) packages)))

;; ---------------
;; standard lib
(require-list standard-packages)

;; ---------------
;; from repositories

(require 'package)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/"))
;; (setq package-enable-at-startup nil)
(package-initialize)

;; this loads any missing packages
(let ((need-to-install (uninstalled-packages repository-packages)))
  (when need-to-install
    (progn
      (package-refresh-contents)
      (dolist (p need-to-install)
        (package-install p)))))


(require-list repository-packages)

(add-to-list 'load-path "~/.emacs.d/site")
(require 'jinja2-mode)

;; ---------------
;; post processing
(ac-config-default) ;; do this once
;; (yas-global-mode t)
;; (elpy-enable)
;; (sml/setup)

;; ====================================
;; variables

;; ---------------
;; platform dependent
(cond
 ((string-equal system-type "windows-nt")
  (progn
    (add-to-list 'exec-path "C:/Program Files/Git/bin")
    (custom-set-variables
     '(default-directory "s:/src/" t)
     ))
  )
 (t
  '(default-directory "~/src/" t)
  )
 )

;; ---------------
;; general
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-directory "~/.emacs.d/auto-insert/")
 '(auto-insert-mode t)
 '(auto-insert-query nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(debug-on-error t)
 '(default-directory "s:/src/" t)
 '(default-frame-alist
    (quote
     ((width . 100)
      (height . 60)
      (left . 400)
      (top . 50))))
 '(delete-selection-mode t)
 '(dired-omit-mode t t)
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(feature-default-i18n-file "~/Documents/i18n.yml" t)
 '(flycheck-check-syntax-automatically (quote (mode-enabled idle-change)))
 '(frame-title-format "%b (%f)" t)
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(hl-line-face "gray13")
 '(indent-tabs-mode nil)
 '(inhibit-eol-conversion t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-scratch-message nil)
 '(jedi:complete-on-dot t)
 '(kill-whole-line t)
 '(next-line-add-newlines nil)
 '(org-directory "~/.emacs.d/org")
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (web-mode emmet-mode tide smart-tabs-mode smart-mode-line markdown-mode)))
 '(query-replace-highlight t)
 '(savehist-mode 1)
 '(scroll-conservatively 10000)
 '(scroll-margin 3)
 '(search-highlight t)
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(user-mail-address "steets@otech.nl")
 '(view-read-only t)
 '(visible-bell t)
 '(wc-word-goal 750 t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ====================================
;; miscellaneous settings

(if window-system
    (progn
      (if (> (x-display-pixel-width) 1280)
          (add-to-list 'default-frame-alist (cons 'width 120))
        (add-to-list 'default-frame-alist (cons 'width 80)))
      (add-to-list 'default-frame-alist
                   (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height)))))
  )
(display-time)
(set-language-environment "UTF-8")
(defalias 'list-buffers 'ibuffer) ; always use ibuffer
(split-window-right)

;; solarized theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)

;; ====================================
;; auto-insert templates
;; (define-auto-insert "\.org\\'" "template.org")

;; ====================================
;; key bindings (C-c for user keys)

(global-set-key (kbd "C-c .") 'emmet-expand-line)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-line-or-region) ;; custom function
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c d") "\C-a\C- \C-n\M-w\C-y") ;; duplicate line
(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file user-init-file)))
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))  ;; join with next line
(global-set-key (kbd "C-c l") 'list-packages)
(global-set-key (kbd "C-c m") 'compile)
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c u") (lambda () (interactive) (revert-buffer-with-coding-system "unix")))
(global-set-key (kbd "C-c w") 'what-line)

;; I try to learn native Emacs keys, but some I want to override
(global-set-key (kbd "C-f")   'isearch-forward)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; reminder of existing useful functions and their key binding
;; M-j     : indent-new-comment-line
;; M-%     : query-replace
;; C-x o   : other-window
;; C-x C-o : delete-blank-lines

;; ====================================
;; hooks

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook 'wc-mode)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'anaconda-mode)

(add-to-list 'auto-mode-alist '("\\.ini\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ===============================
;; functions

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
          (auto-complete-mode 1)))
