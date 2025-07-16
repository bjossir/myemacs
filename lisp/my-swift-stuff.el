;;; Packages we want installed for Swift development

;; Swift editing support
(use-package swift-mode
    :ensure t
    :mode "\\.swift\\'"
    :interpreter "swift")

;; Used to interface with swift-lsp.
(use-package lsp-mode
    :ensure t
    :commands lsp
    :hook ((swift-mode . lsp)))

;; lsp-mode's UI modules
(use-package lsp-ui
    :ensure t)

;; sourcekit-lsp support
(use-package lsp-sourcekit
    :ensure t
    :after lsp-mode
    :custom
    (lsp-sourcekit-executable "/usr/bin/sourcekit-lsp" "Find sourcekit-lsp"))

