
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(package-selected-packages
   (quote
    (go-eldoc helm color-theme-sanityinc-tomorrow company-irony company-irony-c-headers nyan-mode nyan-prompt cider dirtree cargo racer company company-c-headers company-go company-lua company-php go-mode lua-mode)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(if (eq system-type 'darwin)
    (setq mac-option-modifier nil))

(column-number-mode t)
(show-paren-mode t)
(size-indication-mode t)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)

(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-c\C-m" 'compile)

(if (display-graphic-p)  ; GUI
    (progn      
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

(setq load-path (append load-path (list "~/.emacs.d/lisp")))

;; my macports stuff
(load "my-macports-stuff")

;; load my c/c++ stuff
(load "my-c-stuff")

;; load my go stuff
(load "my-go-stuff")

;; load my pascal stuff
(load "my-pascal-stuff")

;; load my lua stuff
(load "my-lua-stuff")

;; load my rust stuff
(load "my-rust-stuff")

;; load my shell stuff
(load "my-shell-stuff")

;; load my helm stuff
(load "my-helm-stuff")

;; copy/move from one dired buffer to another
(setq dired-dwim-target t)

;;(require 'ido)
;;(ido-mode t)
;;(setq ido-enable-flex-matching t)

;; directory tree
(require 'dirtree)

(add-hook 'after-init-hook 'global-company-mode)

