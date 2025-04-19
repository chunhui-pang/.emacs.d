(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))


(use-package rustic
  :ensure t
  :after (rust-mode)
  :config
  (setq rustic-format-on-save nil)
  :custom
  (rustic-cargo-use-last-stored-arguments t))
