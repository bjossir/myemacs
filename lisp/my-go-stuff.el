;; The GOPATH environment variable is where we have our GO projects
(setenv "GOPATH"
        (concat (getenv "HOME") "/gocode"))

;; The PATH variable is used by the emacs shell
(setenv "PATH"
        (concat "/usr/local/go/bin" ":"
                (concat (getenv "GOPATH") "/bin") ":"
                (getenv "PATH")))

;; The exec-path variable is a list of strings. Used by emacs itself
(setq exec-path (append exec-path '("/usr/local/go/bin")))               
(setq exec-path (append exec-path (list (concat (getenv "GOPATH") "/bin"))))

(add-hook 'go-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (set (make-local-variable 'company-backends) '(company-go))
             (company-mode)))

