;;; package --- me

;;; Commentary:
;; some personal definitions of my functions and variables
;; names start with "me/"

;;; Code:

(require 'cl-lib)


(defun me/read-file (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))


(defun me/find-regexp (regexp)
  "Return first occurrence of REGEXP in current buffer."
  (goto-char (point-min))
  (search-forward-regexp regexp)
  (match-string 1))


(defun me/word-frequency ()
  "Return a hash with word frequencies from current buffer."
  (interactive)
  (let ((table (make-hash-table :test 'equal :size 128)))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\\<[[:word:]]+\\>" nil t)
        (let ((word (downcase (match-string 0))))
          (message word)
          (puthash word (1+ (gethash word table 0)) table))
        ))
    (maphash (lambda (key val)
               (message (format "%s: %d" key val)))
             table)))

(setq me/root-dir
      (pcase system-type
        ("windows-nt" "S:\\")
        ("cygwin" "/s/")
        (code "~/src/")
        ))

(defun me/path-join (root &rest dirs)
  "like Python's os.path.join"
  (if (not dirs) root
    (apply 'me/path-join
           (expand-file-name (car dirs) root)
           (cdr dirs))))

(defun me/org-file (name)
  "Return path to org file"
  (me/path-join me/root-dir "org" (concat name ".org")))


(defun me/find-file(directory)
  "Find a file in DIRECTORY"
  (interactive)
  (find-file (read-file-name "Find file: " directory)))

(defun me/god-mode-line ()
  "Change mode line in God mode "
  (cond (god-local-mode
         (progn
           (set-face-background 'mode-line "tomato")
           (set-face-background 'mode-line-inactive "firebrick")))
        (t (progn
             (set-face-background 'mode-line me/mode-line-background)
             (set-face-background 'mode-line-inactive me/mode-line-background-inactive)))))

(defun me/org-show-just-me (&rest _)
  "Fold all other trees, then show entire current subtree."
  (interactive)
  (org-overview)
  (org-reveal)
  (org-show-subtree))

(defun me/switch-to-minibuffer ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

(provide 'me)
;;; me.el ends here
