(defun custom-python-dev ()
  (message "custom for python develop environment...")
  (when (bound-and-true-p lsp-mode)
    (call-interactively #'lsp-workspace-restart)))

(add-hook 'python-mode-hook 'custom-python-dev)
(add-hook 'python-mode-hook #'lsp-deferred)
