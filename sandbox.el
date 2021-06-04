;;; package --- sandbox

;;; Commentary:
;; try new things

;;; Code:

(use-package apt-utils
  :straight (apt-utils
             :type git
             :host github
             :repo "emacsmirror/emacswiki.org"
             :branch "master"
             :files ("apt-utils.el")))

;; https://github.com/emacsorphanage/git-gutter
(use-package git-gutter
  :init (global-git-gutter-mode))

;; https://github.com/lassik/emacs-format-all-the-code
(use-package format-all
  :hook
  ((prog-mode-hook . format-all-mode)
   (format-all-mode-hook . format-all-ensure-formatter)))

;; https://github.com/creichert/ido-vertical-mode.el
(use-package ido-vertical-mode
  :init
  (ido-mode 1)
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

(set-face-attribute 'hl-line nil :inherit nil :background "grey25")

(provide 'sandbox)
;;; sandbox.el ends here
