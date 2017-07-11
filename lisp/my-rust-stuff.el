(setq exec-path (append exec-path (list (concat (getenv "HOME") "/.cargo/bin"))))
(setenv "PATH" (concat (concat (getenv "HOME") "/.cargo/bin") ":" (getenv "PATH")))

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
