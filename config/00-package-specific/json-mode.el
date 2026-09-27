;;; json-mode.el --- -*- lexical-binding: t; -*-
(use-package json-mode :defer t)

(add-hook 'json-mode-hook 'hs-minor-mode)
