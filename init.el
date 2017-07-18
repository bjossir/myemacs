;;; Package --- summary
;;; Commentary:
;;; Code:
(if (eq system-type 'darwin)
    (setq mac-option-modifier nil))

(column-number-mode t)
(show-paren-mode t)
(size-indication-mode t)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(global-set-key "\C-m" 'newline-and-indent)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (set-face-attribute 'default nil :height 160)
  (set-cursor-color "Red"))

;; do not write backups all over the place.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; start package.el with emacs
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(setq load-path (append load-path (list "~/.emacs.d/lisp")))

;; my go stuff
(load "my-go-stuff")

;; my C/C++ stuff
(load "my-c-stuff")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company company-go go-eldoc go-mode use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here


