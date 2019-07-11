;;; package --- org-mode configuration

;;; Commentary:
;; Also loads project-specific initialisation (see bottom)

;;; Code:

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
")
        ("c" "clock" item (clock))
        ))



(defun me/parse-post (entry project)
  "Read blog file fro ENTRY in PROJECT and processes it."
  (let* ((settings (cdr project))
         (post-filename (concat (plist-get settings :base-directory) entry)))
    (with-temp-buffer
      (insert-file-contents post-filename)
      (list :filename post-filename
            :contents (buffer-string)
            :title (org-publish-find-title entry project)
            :date (org-publish-find-date entry project)
            ;; :tags (split-string (me/find-regexp "^\\#\\+filetags:[ ]*\\(.+\\)$"))
            ))))

(defun me/post-summary (entry style project)
  "Default format for site map ENTRY, as a string.
ENTRY is a file name.  STYLE is the style of the sitemap.
PROJECT is the current project."
  (cond ((not (directory-name-p entry))
         (let ((data (me/parse-post entry project)))
           (format "*[[file:%s][%s]]* <%s>\n\n%s"
                   entry (plist-get data :title)
                   (format-time-string "%h %d, %Y" (plist-get data :date))
                   ;; (mapconcat 'identity (plist-get data :tags) ":")
                   (plist-get data :contents))))))

                                        ;(setq org-publish-project-alist nil)
                                        ;(load "~/src/dwim/publish.el")
                                        ;(load "~/src/fiction/rambling/publish.el")

(provide 'org-cfg)
;;; org-cfg.el ends here
