;;; pyim.el --- -*- lexical-binding: t; -*-
(use-package pyim
  :config
  ;; (setq default-input-method "pyim")
  (setq pyim-page-tooltip 'posframe))

(use-package pyim-basedict
  :config
  (pyim-basedict-enable))
