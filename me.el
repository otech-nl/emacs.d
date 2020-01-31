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

(provide 'me)
;;; me.el ends here
