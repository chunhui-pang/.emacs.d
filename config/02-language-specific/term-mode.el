;; customize for term mode
(defun customize-for-term()
  (message "customize for term/ansi-term mode...")
  (linum-mode 0)
  (add-to-list 'company-backends 'company-dict))


(add-hook 'term-mode-hook 'customize-for-term)
