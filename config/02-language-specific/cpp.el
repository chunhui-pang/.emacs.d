;;; for C++ and C
(defun custom-c/cpp-general ()
  (setq gdb-many-windows t)
  (setq gdb-show-main t)
  (setq c-default-style "linux" c-basic-offset 4)
  (global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word)))))

(defun custom-c/cpp ()
  (message "custom for c/cpp environment...")
  (custom-c/cpp-general))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
(add-hook 'c-mode-hook 'custom-c/cpp)
(add-hook 'c++-mode-hook 'custom-c/cpp)
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
