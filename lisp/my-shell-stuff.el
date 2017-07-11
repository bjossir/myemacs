
;; make C-l work like in a normal shell (Press twice)
;; and have a simple prompt

(defun my-shell-hook ()
  (setenv "PS1" "$ ")
  (local-set-key "\C-cl" 'erase-buffer))

(add-hook 'shell-mode-hook 'my-shell-hook)
