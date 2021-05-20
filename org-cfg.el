;;; package --- org-mode configuration

;;; Commentary:
;; Also loads project-specific initialisation (see bottom)

;;; Code:

;; https://orgmode.org/
(use-package org
  :ensure htmlize
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (org-clock-persistence-insinuate)
  (setq org-agenda-custom-commands
        '(("h" "TODOs history of closed tasks"
           todo "DONE|CANCELLED|DEFERRED"
           ((org-agenda-log-mode-items '(clock state))
            (org-agenda-sorting-strategy '(timestamp-down))))
          ("o" "Open TODOs"
           todo "TODO|NEXT|ACTIVE"
           ((org-agenda-log-mode-items '(clock state))
            (org-agenda-sorting-strategy '(priority-down todo-state-down timestamp-down))))
          ("p" "Review previous month"
           agenda ""
           ((org-agenda-span 'month)
            (org-agenda-start-day "-1m")
            (org-agenda-start-with-log-mode t)
            (org-agenda-log-mode-items '(clock state))
            (org-agenda-archives-mode t) ; include archive files
            ))
          ("l" "TODOs for later"
           todo "SOMEDAY"
           ((org-agenda-sorting-strategy '(todo-state-up priority-down)))))
        org-capture-templates
        `(("b" "blog" entry (file "~/src/dwim/posts/index.org") "* DRAFT %?\n%a"
           :prepend t
           :emtpy-lines 1
           :unnarrowed t)
          ("h" "habit" entry (file org-default-notes-file) "* NEXT %?\n%U\n%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")
          ("j" "journal" entry (file+olp+datetree org-default-notes-file "Journal") "")
          ;; ("z" "zettelkasten" entry (file+olp+datetree org-default-notes-file "Zettelkasten") "")
          ("m" "meeting" entry (file org-default-notes-file) "* %U: %?               :meeting:\nWith:\n\n")
          ("n" "note" entry (file+headline org-default-notes-file "Personal Knowledge Base") "* %?\n%U\n%a"
           :prepend t
           :emtpy-lines 1
           :unnarrowed t)
          ("t" "todo" entry (file+headline org-default-notes-file "Work") "* TODO %?\n%U\n%a"
           :prepend t
           :emtpy-lines 1
           :unnarrowed t)
          ("w" "writing" entry (file "~/src/fiction/process.org") "* %?\n%a"
           :prepend t
           :emtpy-lines 1
           :unnarrowed t)
          ))
  :bind (("\C-c a" . org-agenda)
         ("\C-c c" . org-capture)
         ("\C-c l" . org-store-link)))

;; https://www.emacswiki.org/emacs/AutoInsertMode
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

;; Zettelkasten in Org
;; https://www.orgroam.com/manual.html
(use-package org-roam
  :after org
  :config
  (setq org-roam-db-update-method 'immediate)
  :hook
  ((org-mode . org-roam-mode))  ;; could also be from after-init-hook
  :custom
  (org-roam-directory (my/org-path "roam"))
  (org-roam-capture-templates
   '(("d" "default" plain (function org-roam--capture-get-point)
      "%?"
      :file-name "%<%Y-%m-%d-%H%M%S>-${slug}"
      :head "#+ROAM_TAGS: \n#+ROAM_ALIAS: \n"
      :unnarrowed t)))
)

;; use deft to search Zettels: https://www.orgroam.com/manual.html#Full_002dtext-search-interface-with-Deft
(use-package deft
  :after org-roam
  :config (setq deft-directory org-roam-directory
                deft-extensions '("md" "org")
                deft-default-extension "org"))

;; find common writing problems
;; https://github.com/bnbeckwith/writegood-mode
(use-package writegood-mode
  :commands writegood-mode
  :diminish writegood-mode
  :init (mapcar (lambda (mode-hook)
                  (add-hook mode-hook #'writegood-mode))
                '(text-mode-hook
                  org-mode-hook)))

(provide 'org-cfg)
;;; org-cfg.el ends here
