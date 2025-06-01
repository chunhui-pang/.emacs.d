(defun custom-lisp ()
  (message "custom for lisp environment..."))

(add-hook 'emacs-lisp-mode-hook 'custom-lisp)
