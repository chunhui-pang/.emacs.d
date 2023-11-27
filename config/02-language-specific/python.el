(defun custom-elpy ()
  (elpy-enable))

(defun custom-python ()
  (message "custom for python environment...")
  (custom-elpy)
)

(add-hook 'python-mode-hook 'custom-python)
