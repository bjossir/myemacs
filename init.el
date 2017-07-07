(if (eq system-type 'darwin)
    (setq mac-option-modifier nil))

(column-number-mode t)
(show-paren-mode t)
(size-indication-mode t)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(global-set-key "\C-m" 'newline-and-indent)

(if (display-graphic-p)  ; GUI
    (progn
      (tool-bar-mode -1)
      (set-face-attribute 'default nil :height 160)
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

;; load my pascal stuff
(load "my-pascal-stuff")

;; load my lua stuff
(load "my-lua-stuff")



