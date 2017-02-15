(if window-system
    (progn
      (if (> (x-display-pixel-width) 1280)
          (add-to-list 'default-frame-alist (cons 'width 120))
        (add-to-list 'default-frame-alist (cons 'width 80)))
      (add-to-list 'default-frame-alist
                   (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height)))))
  )

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; as per http://pragmaticemacs.com/installing-and-setting-up-emacs/
(setq prelude-guru nil)  ;; guru is annoying
;; (setq prelude-use-smooth-scrolling t)
(menu-bar-mode 1)  ;; I like a menu bar, thank you
(setq whitespace-line-column 999)  ;; 80 is a bit short...
