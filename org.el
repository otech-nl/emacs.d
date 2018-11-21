(setq org-capture-templates
      `(("t" "todo" entry
         (file ,(expand-file-name "refile.org" org-directory))
         "* TODO %?\n%U\n%a")

        ("r" "respond" entry
         (file ,(expand-file-name "respond.org" org-directory))
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U%a\n")

        ("n" "note" entry
         (file ,(expand-file-name "refile.org" org-directory))
         "* %? :NOTE:\n%U\n%a")

        ("j" "Journal" entry
         (file+olp+datetree ,(expand-file-name "journal.org" org-directory))
         "* %?\n%U")

        ("w" "org-protocol" entry
         (file ,(expand-file-name "refile.org" org-directory))
         "* TODO Review %c\n%U")

        ("m" "Meeting" entry
         (file ,(expand-file-name "meeting.org" org-directory))
         "* MEETING with %? :MEETING:\n%U")

        ("p" "Phone call" entry
         (file ,(expand-file-name "respond.org" org-directory))
         "* PHONE %? :PHONE:\n%U")

        ("h" "Habit" entry
         (file ,(expand-file-name "notes.org" org-directory))
         "* NEXT %?\n%U\n%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")))
