;;; for C++ and C
(defun custom-c/cpp-enable-other-modes ()
  (ggtags-mode 1)
  (require 'irony)
  (irony-mode 1)
  (outline-minor-mode 1))

(defun custom-c/cpp-general ()
  (setq gdb-many-windows t)
  (setq gdb-show-main t)
  (setq c-default-style "linux" c-basic-offset 4)
  (global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word)))))

(defun custom-c/cpp-company ()
  (custom-set-variables
   '(company-backends
	 (quote
	  ((company-clang company-c-headers company-files company-cmake)
	   (company-irony company-c-headers company-files company-cmake))))))

(defun custom-c/cpp ()
  (message "custom for c/cpp environment...")
  (custom-c/cpp-enable-other-modes)
  (custom-c/cpp-general)
  (custom-c/cpp-company))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-hook 'custom-c/cpp)
(add-hook 'c++-mode-hook 'custom-c/cpp)
