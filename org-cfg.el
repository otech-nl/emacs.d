;;; package --- org-mode configuration

;;; Commentary:
;; Also loads project-specific initialisation (see bottom)

;;; Code:

(use-package org
  :ensure htmlize
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (org-clock-persistence-insinuate)
  (setq org-agenda-custom-commands
        '(("p" "TODOs sorted by priority, deadline, schedule"
           todo "TODO|NEXT|ACTIVE|WAITING"
           ((org-agenda-overriding-header "\nTODOs sorted by priority, deadline, schedule, state")
            (org-agenda-sorting-strategy '(priority-down deadline-up scheduled-up todo-state-down))))))
  :bind (("\C-c l" . org-store-link)
         ("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ;; ("\C-c t" . (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
         ("\C-c t" . (lambda () (interactive) (org-todo-list 1) (delete-other-windows)))
         ;; ("\C-c b" . org-switchb)
         ))

(use-package autoinsert
  :config
  (setq auto-insert-query nil)
  (auto-insert-mode 1)
  (add-hook 'find-file-hook 'auto-insert)
  (setq auto-insert-alist nil) ;; remove this to restore defaults
  (define-auto-insert '(org-mode . "org-mode file")
    '("org-mode header"
      "#+TITLE: " (file-name-base (buffer-file-name)) \n
      "#+DATE: " (format-time-string "%Y-%m-%d") \n
      "#+LANGUAGE: nl" \n
      \n
      )))

(use-package captain
  :defer t
  :config
  (add-hook
   'org-mode-hook
   (lambda ()
     (setq captain-predicate (lambda () (not (org-in-src-block-p)))))))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline org-default-notes-file "Work") "* TODO %?\n%U\n%a" :prepend t)

        ("n" "note" entry (file org-default-notes-file) "* %? :NOTE:\n%U\n%a")

        ("m" "meeting" entry (file org-default-notes-file) "* MEETING with %? :MEETING:\n%U")

        ("h" "habit" entry (file org-default-notes-file) "* NEXT %?\n%U\n%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")
        ("j" "journal" entry (file+olp+datetree org-default-notes-file "Journal") "")
        ))

(provide 'org-cfg)
;;; org-cfg.el ends here
