(setq org-capture-templates
      `(("t" "todo" entry (file "~/Dropbox/org/refile.org") "* TODO %?\n%U\n%a")

        ("n" "note" entry (file "~/Dropbox/org/refile.org") "* %? :NOTE:\n%U\n%a")

        ("m" "meeting" entry (file "~/Dropbox/org/refile.org") "* MEETING with %? :MEETING:\n%U")

        ("h" "habit" entry (file "~/Dropbox/org/refile.org") "* NEXT %?\n%U\n%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")))
