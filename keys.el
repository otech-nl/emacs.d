(global-set-key (kbd "C-c /")  ; (un)comment line or region
                (lambda () (interactive)
                  (if (region-active-p)
                      (comment-or-uncomment-region (region-beginning) (region-end))
                    (comment-or-uncomment-region
                     (line-beginning-position) (line-end-position)))))
(global-set-key (kbd "C-c b") 'eval-buffer)
(global-set-key (kbd "C-c d")  ; duplicate line
                (lambda () (interactive)
                  (save-excursion
                    (let ((kill-read-only-ok t) deactivate-mark)
                      (toggle-read-only 1) (kill-whole-line) (toggle-read-only 0) (yank)))))
(global-set-key (kbd "C-c e") (lambda () (interactive) (find-file "~/src/notes/emacs.org")))
(global-set-key (kbd "C-c C-f")  ; find org file
                (lambda() (interactive)
                  (find-file (read-file-name "Find file: " org-directory))))
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c I") (lambda () (interactive) (org-clock-in '(4))))
(global-set-key (kbd "C-c o") 'occur)
(global-set-key (kbd "C-c O") #'org-clock-out)
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "C-c n") (lambda () (interactive) (deft)))
(global-set-key (kbd "C-c p") 'package-list-packages)
(global-set-key (kbd "C-c C-p") 'org-publish)
(global-set-key (kbd "C-c r") (lambda () (interactive) (find-file "~/Dropbox/org/refile.org")))
(global-set-key (kbd "C-c s") 'sort-lines)
(global-set-key (kbd "C-c u")  ;; dos2unix
                (lambda() (interactive)
                  (revert-buffer-with-coding-system 'unix t)
                  (save-excursion
                    (goto-char (point-min))
                    (while (search-forward "" nil t) (replace-match "")))))
(global-set-key (kbd "C-c w") (lambda () (interactive) (find-file "~/Dropbox/org/work.org")))
(global-set-key (kbd "C-c <up>")  ; move line up
                (lambda () (interactive)
                  (transpose-lines 1) (forward-line -2) (indent-according-to-mode)))
(global-set-key (kbd "C-c <down>")  ; move line down
                (lambda () (interactive)
                  (forward-line 1) (transpose-lines 1) (forward-line -1)
                  (indent-according-to-mode)))

;; overrides
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
