;;; yaml-ts-mode.el --- -*- lexical-binding: t; -*-
(use-package yaml-ts-mode
  :ensure t
  :mode
  ("\\.yaml\\'" ;;;; Standard YAML files
   "\\.yml\\'" ;;;; Common shorthand for YAML
   "\\.eyaml\\'")) ;;;; Encrypted YAML files
