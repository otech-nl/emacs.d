;;; package --- key bindings

;;; Commentary:
;; see als use-package bindings in packages.el
;; convention: C-c for user keys

;;; Code:

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-/")  ; (un)comment line or region
                (lambda () (interactive)
                  (if (region-active-p)
                      (comment-or-uncomment-region (region-beginning) (region-end))
                    (comment-or-uncomment-region
                     (line-beginning-position) (line-end-position)))))
(global-set-key (kbd "M-<up>")  ; move line up
                (lambda () (interactive)
                  (transpose-lines 1) (forward-line -2) (indent-according-to-mode)))
(global-set-key (kbd "M-<down>")  ; move line down
                (lambda () (interactive)
                  (forward-line 1) (transpose-lines 1) (forward-line -1)
                  (indent-according-to-mode)))

(global-set-key (kbd "C-c b") 'eval-buffer)
(global-set-key (kbd "C-c d")  ; duplicate line
                (lambda () (interactive)
                  (save-excursion
                    (let ((kill-read-only-ok t) deactivate-mark)
                      (read-only-mode 1) (kill-whole-line) (read-only-mode 0) (yank)))))
(global-set-key (kbd "C-c f") 'format-all-buffer)
(global-set-key (kbd "C-c g") 'gnus)
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c J") 'org-clock-goto)
(global-set-key (kbd "C-c k") (lambda () (interactive) (find-file "~/.emacs.d/keys.el")))
(global-set-key (kbd "C-c C-l") 'display-line-numbers-mode)
(global-set-key (kbd "C-c n") (lambda () (interactive) (find-file "~/Dropbox/org/notes.org")))
(global-set-key (kbd "C-c m") 'wl)
(global-set-key (kbd "C-c o e") 'org-entities-help)
(global-set-key (kbd "C-c C-f")  ; find org file
                (lambda() (interactive)
                  (find-file (read-file-name "Find file: " org-directory))))
(global-set-key (kbd "C-c o i") (lambda () (interactive) (org-clock-in '(4))))
(global-set-key (kbd "C-c o o") #'org-clock-out)
(global-set-key (kbd "C-c r") 'package-list-packages)
(global-set-key (kbd "C-c p") (lambda () (interactive) (find-file "~/.emacs.d/packages.el")))
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c u")  ;; dos2unix
                (lambda() (interactive)
                  (revert-buffer-with-coding-system 'unix t)
                  (save-excursion
                    (goto-char (point-min))
                    (while (search-forward "" nil t) (replace-match "")))))
(global-set-key (kbd "C-c w") 'eww)

;; overrides
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(provide 'keys)
;;; keys.el ends here
