(defun custom-lisp-company ()
  (custom-set-variables
   '(company-backends
	 (quote
	  (company-elisp company-abbrev company-files)))))

(defun custom-lisp ()
  (message "custom for lisp environment...")
  (custom-lisp-company))

(add-hook 'emacs-lisp-mode-hook 'custom-lisp)
