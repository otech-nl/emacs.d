(if window-system
    (progn
      (if (> (x-display-pixel-width) 1280)
          (add-to-list 'default-frame-alist (cons 'width 120))
        (add-to-list 'default-frame-alist (cons 'width 80)))
      (add-to-list 'default-frame-alist
                   (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height)))))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "/tmp/emacs-backups"))))
 '(delete-old-versions t)
 '(global-linum-mode t)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(menu-bar-mode 1)
 '(package-selected-packages
   (quote
    (yaml-mode feature-mode neotree tide lua-mode markdown-mode auto-virtualenvwrapper realgud csv-mode php+-mode company-jedi jinja2-mode jedi web-mode geiser company-anaconda anaconda-mode json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window)))
 '(prelude-auto-save nil)
 '(prelude-guru nil)
 '(realgud-safe-mode nil)
 '(version-control t)
 '(whitespace-line-column 999))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
