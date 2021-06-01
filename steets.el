;;; package --- steets

;;; Commentary:
;; some personal definitions of my functions and variables
;; names start with "steets/"

;;; Code:

(require 'cl-lib)


(defun steets/read-file (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))


(defun steets/find-regexp (regexp)
  "Return first occurrence of REGEXP in current buffer."
  (goto-char (point-min))
  (search-forward-regexp regexp)
  (match-string 1))


(defun steets/word-frequency ()
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

(setq steets/root-dir
      (pcase system-type
        ("windows-nt" "S:\\")
        ("cygwin" "/s/")
        (code "~/src/")
        ))

(defun steets/path-join (root &rest dirs)
  "like Python's os.path.join"
  (if (not dirs) root
    (apply 'steets/path-join
           (expand-file-name (car dirs) root)
           (cdr dirs))))

(defun steets/org-file (name)
  "Return path to org file"
  (steets/path-join steets/root-dir "org" (concat name ".org")))


(defun steets/find-file(directory)
  "Find a file in DIRECTORY"
  (interactive)
  (find-file (read-file-name "Find file: " directory)))

(defun steets/god-mode-line ()
  "Change mode line in God mode "
  (cond (god-local-mode
         (progn
           (set-face-background 'mode-line "tomato")
           (set-face-background 'mode-line-inactive "firebrick")))
        (t (progn
             (set-face-background 'mode-line steets/mode-line-background)
             (set-face-background 'mode-line-inactive steets/mode-line-background-inactive)))))

(defun steets/org-show-just-me (&rest _)
  "Fold all other trees, then show entire current subtree."
  (interactive)
  (org-overview)
  (org-reveal)
  (org-show-subtree))

(defun steets/switch-to-minibuffer ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

;; https://gist.github.com/blueabysm/e69ceb62e41d68cc81ea2c6791db25c2
;; http://astyle.sourceforge.net/astyle.html
(defun steets/astyle-this-buffer ()
  "Use astyle command to auto format c/c++ code."
  (interactive "r")
  (let* ((original-point (point)))
    (progn
      (if (executable-find "astyle")
          (shell-command-on-region
           (point-min) (point-max)
           (concat
            "astyle"
            " --style=java"
            " --suffix=none"
            " --indent=spaces=2"
            " --indent-cases"
            " --indent-modifiers"
            " --indent-namespaces"
            " --indent-switches"
            " --pad-oper"
            " --pad-comma"
            " --unpad-paren"
            " --align-pointer=type"
            " --align-reference=name"
            " --add-braces"
            " --max-code-length=100"
            )
           (current-buffer) t
           (get-buffer-create "*Astyle Errors*") t)
        (message "Cannot find binary \"astyle\", please install first."))
      (goto-char original-point))))

(provide 'steets)
;;; steets.el ends here
