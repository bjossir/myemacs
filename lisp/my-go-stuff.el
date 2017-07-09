(add-hook 'go-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (set (make-local-variable 'company-backends) '(company-go))
             (company-mode)))

