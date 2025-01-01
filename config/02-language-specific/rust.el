(use-package rust-mode :defer t
  :config
  (add-hook 'rust-mode-hook #'lsp-deferred))
