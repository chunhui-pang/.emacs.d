;;; elpy.el --- -*- lexical-binding: t; -*-
(use-package elpy :defer t
  :config
  (setq elpy-rpc-python-command "python3")
  (elpy-enable)
  )
