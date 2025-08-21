;;; Package --- summary
;;; Commentary:
;;; Code:

;; Go editing support
(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook (go-mode . eglot-ensure))

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)))

(provide 'my-go-stuff)
;;; my-go-stuff.el ends here
