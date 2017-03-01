(global-set-key (kbd "C-c /") 'comment-or-uncomment-line-or-region) ;; custom function
(global-set-key (kbd "C-c j") (lambda () (interactive) (join-line -1)))  ;; join with next line
(global-set-key (kbd "C-x k") 'kill-this-buffer)  ;; override
