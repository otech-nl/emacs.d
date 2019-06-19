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


(setq org-publish-project-alist
      '(("notes-draft"
         :base-directory "~/src/notes/"
         :publishing-directory "~/src/notes/html"
         :publishing-function org-html-publish-to-html
         )

        ;; ("images"
        ;;  :base-directory "~/images/"
        ;;  :base-extension "jpg\\|gif\\|png"
        ;;  :publishing-directory "/ssh:user@host:~/html/images/"
        ;;  :publishing-function org-publish-attachment)

        ;; ("other"
        ;;  :base-directory "~/other/"
        ;;  :base-extension "css\\|el"
        ;;  :publishing-directory "/ssh:user@host:~/html/other/"
        ;;  :publishing-function org-publish-attachment)

        ;; ("website" :components ("orgfiles" "images" "other"))
        ))

;; derive notes from notes-draft
(add-to-list 'org-publish-project-alist
             (cons "notes"
              (plist-put
               (cdr (copy-alist (assoc "notes-draft" org-publish-project-alist)))
               :publishing-directory "/sftp:vps.otech.nl:~/notes/")))
