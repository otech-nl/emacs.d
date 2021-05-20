;;; package --- key bindings

;;; Commentary:
;; see also use-package bindings in packages.el

;;; Code:

;; convention: C-c <letter> for user keys
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'previous-buffer)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "M-<up>")  ; move line up
                (lambda () (interactive)
                  (transpose-lines 1) (forward-line -2) (indent-according-to-mode)))
(global-set-key (kbd "M-<down>")  ; move line down
                (lambda () (interactive)
                  (forward-line 1) (transpose-lines 1) (forward-line -1)
                  (indent-according-to-mode)))

(global-set-key (kbd "C-c b") 'eval-buffer)
(global-set-key (kbd "C-c D") 'docker)
(global-set-key (kbd "C-c d")  ; duplicate line
                (lambda () (interactive)
                  (save-excursion
                    (let ((kill-read-only-ok t) deactivate-mark)
                      (read-only-mode 1) (kill-whole-line) (read-only-mode 0) (yank)))))
(global-set-key (kbd "C-c e") 'speedbar)
(global-set-key (kbd "C-c f") 'format-all-buffer)
(global-set-key (kbd "C-c g") 'grep)
;; (global-set-key (kbd "C-c g") 'gnus)
(global-set-key (kbd "C-c i") (lambda () (interactive) (me/find-file "~/.emacs.d/")))
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c l") 'package-list-packages)
;; (global-set-key (kbd "C-c l") 'display-line-numbers-mode)
;; (global-set-key (kbd "C-c m") 'mu4e)
(global-set-key (kbd "C-c m") 'compile)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(global-set-key (kbd "C-c o b") (lambda () (interactive) (find-file "~/src/dwim/posts/index.org")))
(global-set-key (kbd "C-c o c") 'me/org-show-just-me) ;; center
(global-set-key (kbd "C-c o d") 'deft)
(global-set-key (kbd "C-c o e") 'org-entities-help)
(global-set-key (kbd "C-c o f") (lambda () (interactive) (me/find-file org-directory)))
(global-set-key (kbd "C-c o i") (lambda () (interactive) (org-clock-in '(4))))
(global-set-key (kbd "C-c o j") 'org-clock-goto)
(global-set-key (kbd "C-c o n") (lambda () (interactive) (find-file (my/org-path "notes.org"))))
(global-set-key (kbd "C-c o o") #'org-clock-out)
(global-set-key (kbd "C-c o v") 'org-velocity)
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c S") 'window-swap-states)
(global-set-key (kbd "C-c t") 'ansi-term)
(global-set-key (kbd "C-c u")  ;; dos2unix
                (lambda() (interactive)
                  (revert-buffer-with-coding-system 'unix t)
                  (save-excursion
                    (goto-char (point-min))
                    (while (search-forward "" nil t) (replace-match "")))))
(global-set-key (kbd "C-c v") 'insert-char)
(global-set-key (kbd "C-c w") 'powerthesaurus-lookup-word-dwim)
(global-set-key (kbd "C-c z /") #'deft)
(global-set-key (kbd "C-c z b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c z c") #'org-roam-capture)
(global-set-key (kbd "C-c z d") #'org-roam-find-directory)
(global-set-key (kbd "C-c z f") #'org-roam-find-file)
(global-set-key (kbd "C-c z h") #'org-roam-find-index)
(global-set-key (kbd "C-c z i") #'org-roam-insert)
(global-set-key (kbd "C-c z t") #'org-roam-buffer-toggle-display)

;; overrides
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-z") 'undo) ;Emacs default is bound to hide Emacs.

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file))

(provide 'keys)
;;; keys.el ends here
