(if (eq system-type 'darwin)
    (setq mac-option-modifier nil))

(column-number-mode t)
(show-paren-mode t)
(size-indication-mode t)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(global-set-key "\C-m" 'newline-and-indent)

(setenv "PS1" "$ ")

(if (display-graphic-p)  ; GUI
    (progn
      (setenv "GOPATH" (concat (getenv "HOME") "/gocode"))
      (setenv "PATH"
              (concat
               (concat (getenv "HOME") "/.cargo/bin") ":"
               "/usr/local/go/bin" ":"
               "/opt/local/bin" ":"
               "/opt/local/sbin" ":"
               (concat (getenv "GOPATH") "/bin") ":"
               (getenv "PATH")))
      (setq exec-path (append exec-path (list (concat (getenv "HOME") "/.cargo/bin"))))
      (setq exec-path (append exec-path '("/usr/local/go/bin")))
      (setq exec-path (append exec-path '("/opt/local/bin")))
      (setq exec-path (append exec-path '("/opt/local/sbin")))
      (setq exec-path (append exec-path (list (concat (getenv "GOPATH") "/bin"))))
      (tool-bar-mode -1)
      (set-face-attribute 'default nil :height 180)
      (set-cursor-color "Red")))

;; do not write backups all over the place.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; start package.el with emacs
(require 'package)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))

;; initialize package.el
(package-initialize)

;; my lisp folder
(setq load-path (append load-path (list "~/.emacs.d/lisp")))

;; load my c/c++ stuff
(load "my-c-stuff")

;; load my go stuff
(load "my-go-stuff")

;; load my pascal stuff
(load "my-pascal-stuff")

;; load my lua stuff
(load "my-lua-stuff")

;; make C-l work like in a normal shell (Press twice)
(defun my-shell-hook ()
  (local-set-key "\C-cl" 'erase-buffer))

(add-hook 'shell-mode-hook 'my-shell-hook)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; copy/move from one dired buffer to another
(setq dired-dwim-target t)

(add-hook 'after-init-hook 'global-company-mode)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;(require 'nyan-mode)
;;(nyan-mode t)

;; directory tree
(require 'dirtree)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nyan-mode nyan-prompt cider dirtree cargo racer company company-c-headers company-go company-lua company-php go-mode lua-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
