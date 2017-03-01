(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(defun text-mode-settings ()
  "custom settings for text-based modes"
  (turn-on-visual-line-mode)
  (setq-local whitespace-line-column 999)
  )
