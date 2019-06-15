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

;;(add-to-list 'load-path "/usr/share/emacs24/site-lisp/")
;;(require 'ox-rss)
;; (setq org-publish-project-alist
;;        `(("fiction"
;;           :base-directory "~/src/fiction/"
;;           :base-extension "org"
;;           :html-link-home "http://otech.nl/"
;;           :html-link-use-abs-url t
;;           :rss-extension "xml"
;;           :publishing-directory "~/src/fiction/"
;;           :publishing-function (org-rss-publish-to-rss)
;;           :index-title "Sitemap"
;;           :section-numbers nil
;;           :exclude ".*"            ;; To exclude all files...
;;           :include ("blog.org")   ;; ... except index.org.
;;           :table-of-contents nil)))

(org2web-add-project
 '("Random Ramblings"
   :about ("About" "/about/")
   :category-ignore-list ("themes" "assets" "drafts")
   :confound-email t
   :ignore ("drafts")
   :publishing-directory "~/src/randomrambler.github.io"
   :remote (git "https://github.com/randomrambler/randomrambler.github.io.git" "master")
   :repository-directory "~/src/fiction/blog"
   :site-domain "http://blog.randomrambler.nl/"
   :site-main-title "Random Ramblings"
   :site-sub-title "Writing about writing"
   :summary (("tags" :tags) ("date" :date))
   :theme (rr)
   :theme-root-directory nil
   :web-server-port 7654
   ))
