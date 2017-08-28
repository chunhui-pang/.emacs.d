;;; for golang

(defun custom-golang-company ()
  (custom-set-variables
   '(company-backends
	 (quote
	  ((company-go)
	   (company-files))))))

(defun custom-golang ()
  (message "custom for golang environment...")
  (custom-golang-company))

(add-hook 'go-mode-hook 'custom-golang)

