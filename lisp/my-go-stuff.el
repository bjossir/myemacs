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
             (go-eldoc-setup)
             ; Godef jump key binding                                                      
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "M-,") 'pop-tag-mark)
             (set (make-local-variable 'compile-command)
                  (concat "go build -v " buffer-file-name))
             (local-set-key (kbd "C-c C-h") 'godoc)
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (set (make-local-variable 'company-backends) '(company-go))
             (company-mode)))

