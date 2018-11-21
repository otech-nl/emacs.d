;;; ===========================================================
;;; key bindings (C-c for user keys)

;; package specific key bindings in package.el

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c /") 'steets:comment-or-uncomment-line-or-region)
(global-set-key (kbd "C-c S") 'crux-find-shell-init-file)
(global-set-key (kbd "C-c b") 'eval-buffer)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c e") 'crux-find-user-init-file)
(global-set-key (kbd "C-c C-f") 'steets:find-org-file)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c i") 'irc)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c o") 'sort-lines)  ;; "order"
(global-set-key (kbd "C-c r") 'package-list-packages)  ;; "repo"
(global-set-key (kbd "C-c s") 'crux-swap-windows)
(global-set-key (kbd "C-c t") 'crux-visit-term-buffer)
(global-set-key (kbd "C-c u") 'steets:dos2unix)
(global-set-key (kbd "C-x k") 'kill-this-buffer)  ;; override
(global-set-key [(control shift down)] 'steets:move-text-down)
(global-set-key [(control shift return)] 'crux-smart-open-line-above)
(global-set-key [(control shift up)] 'steets:move-text-up)
(global-set-key [(shift return)] 'crux-smart-open-line)
(global-set-key [remap kill-ring-save] 'easy-kill)
(global-set-key [remap mark-sexp] 'easy-mark)

;; (define-key key-translation-map (kbd "<s-mouse-1>") (kbd "<mouse-2>"))
(global-set-key [remap kill-whole-line] 'crux-kill-whole-line)
