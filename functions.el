;;; ===========================================================
;;; functions

(defun steets:comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun steets:text-mode-settings ()
  "custom settings for text-based modes"
  (turn-on-visual-line-mode)
  (setq-local whitespace-line-column 999))

(defun steets:prog-mode-settings ()
  "custom settings for code-based modes"
  (turn-on-visual-line-mode)
  (whitespace-mode t)
  (line-number-mode t))

(defun steets:move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun steets:move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun steets:dos2unix ()
  "Convert a DOS encoded file to Unix"
  (interactive)
  (revert-buffer-with-coding-system 'unix t)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "" nil t)
      (replace-match ""))))

(defun steets:find-org-file ()
  "Open a file in org directory"
  (interactive)
  (find-file (read-file-name "Find file: " org-directory)))


(defun steets:org-wc-subtree ()
  "Count words in current org-mode subtree"
  (interactive)
  (save-restriction
    (org-narrow-to-subtree)
    (let ((wc (count-words (point-min) (point-max))))
      (message (format "%d words" wc)))))
