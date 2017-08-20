;;; Package --- summary
;;; Commentary:
;;; Code:

;; The exec-path variable is a list of strings. Used by emacs itself
(setq exec-path (append exec-path (list (concat (getenv "HOME") "/.cargo/bin"))))

;; The PATH variable is used by the emacs shell
(setenv "PATH"
        (concat (getenv "HOME")
                "/.cargo/bin" ":"
                (getenv "PATH")))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(provide 'my-rust-stuff)
;;; my-rust-stuff.el ends here

