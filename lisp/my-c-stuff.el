;;; Package --- summary
;;; Commentary:
;;; Code:

;; cc mode stuff
;; my personal style for c++

(defconst brs-c-style
  '((c-basic-offset . 4)
    (c-comment-only-line-offset . 0)
    (c-hanging-braces-alist . ((substatement-open before after)))
    (c-offsets-alist . ((topmost-intro        . 0)
                        (topmost-intro-cont   . 0)
                        (substatement         . +)
                        (substatement-open    . 0)
                        (case-label           . 0)
                        (access-label         . -)
                        (inclass              . +)
                        (namespace-open       . 0)
                        (namespace-close      . 0)
                        (innamespace          . 0)
                        (inline-open          . 0)))))

(c-add-style "BRS" brs-c-style)

(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "BRS")))

(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "ellemtel")
             (c-set-offset 'case-label 0)
             (setq c-basic-offset 4)))

(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode)) auto-mode-alist))

(provide 'my-c-stuff)
;;; my-c-stuff.el ends here
