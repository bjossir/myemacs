;;;; Package --- summary
;;; Commentary:
;;; Code:

(if (eq system-type 'darwin)
    (setq mac-option-modifier nil))

(electric-pair-mode 1)

;; Add MELPA as a package source
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(when (display-graphic-p)
  (tool-bar-mode -1)
  (setq default-directory "~/")
  (set-cursor-color "Red")
  (set-frame-font "Source Code Pro")
  (set-face-attribute 'default nil :height 160))

(defun remap-faces-default-attributes ()
  (let ((family (face-attribute 'default :family))
        (height (face-attribute 'default :height)))
    (mapcar (lambda (face)
              (face-remap-add-relative
               face :family family :weight 'normal :height height))
          (face-list))))

(when (display-graphic-p)
  (add-hook 'minibuffer-setup-hook 'remap-faces-default-attributes)
  (add-hook 'change-major-mode-after-body-hook 'remap-faces-default-attributes))

(column-number-mode t)
(show-paren-mode t)
(size-indication-mode t)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

;; do not write backups all over the place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(global-set-key "\C-m" 'newline-and-indent)

(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1))
  (next-line)
  (indent-for-tab-command))

(defun insert-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1))
  (previous-line)
  (indent-for-tab-command))

(global-set-key (kbd "C-c M-n") 'insert-line-above)
(global-set-key (kbd "C-c n") 'insert-line-below)

(setq load-path (append load-path (list "~/.emacs.d/lisp")))

;; my C/C++ stuff
(load "my-c-stuff")

;; my Python stuff
(load "my-python-stuff")

;; my swift stuff
;;(load "my-swift-stuff")

;; my go stuff
;;(load "my-go-stuff")

;;(which-key-mode 1)

(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))

(use-package vterm)

;; .editorconfig file support
(use-package editorconfig
    :ensure t
    :config (editorconfig-mode +1))

;; Rainbow delimiters makes nested delimiters easier to understand
(use-package rainbow-delimiters
    :ensure t
    :hook ((prog-mode . rainbow-delimiters-mode)))

;; Company mode (completion)
(use-package company
    :ensure t
    :config
    (global-company-mode +1))

;; Powerline
;;(use-package powerline
;;  :ensure t
;;  :config
;;  (powerline-default-theme))

;; Spaceline
;;(use-package spaceline
;;  :ensure t
;;  :after powerline
;;  :config
;;  (spaceline-emacs-theme))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   '("3512fce0f3d84ca65bb58d7bfe9ddedf27ff96eee573c6e6dc0ba61d25a47d72"
     "5b01334cb330cd69e5f3d6214521c9f9d703d1c31ca0f4f04f36b6cf9f4870c8"
     default))
 '(package-selected-packages
   '(base16-theme company-go exec-path-from-shell flycheck-golangci-lint
                  go-eldoc go-gen-test go-tag gorepl-mode lsp-pyright
                  lsp-sourcekit lsp-ui marginalia pyvenv
                  rainbow-delimiters rust-mode spaceline swift-mode
                  vertico vterm which-key)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



