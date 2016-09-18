(defun custom-python-company ()
  (jedi:setup)
  (setq jedi:complete-on-dot t))

(defun custom-python-enable-other-modes ()
  (outline-minor-mode 1))

(defun custom-python ()
  (message "custom for python environment...")
  (custom-python-enable-other-modes)
  (custom-python-company))

(add-hook 'python-mode-hook 'custom-python)

