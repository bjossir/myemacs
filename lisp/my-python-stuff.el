;;; Package --- summary
;;; Commentary:
;;; Code:

;; python mode stuff

;;(use-package pyvenv
;;  :ensure t)

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred


