;; customize for term mode
(defun customize-for-behaviours ()
  (linum-mode 0)
  (add-to-list 'company-backends 'company-dict))

(defun customize-for-keyboard ()
  (define-key term-raw-map (kbd "M-H") 'windmove-left)
  (define-key term-raw-map (kbd "M-J") 'windmove-down)
  (define-key term-raw-map (kbd "M-K") 'windmove-up)
  (define-key term-raw-map (kbd "M-L") 'windmove-right))

(defun customize-for-term-mode ()
  (customize-for-behaviours)
  (customize-for-keyboard)
  (message "customize for term/ansi-term mode..."))

(add-hook 'term-mode-hook 'customize-for-term-mode)
