;;; theme.el --- -*- lexical-binding: t; -*-
;; (use-package solarized-theme
;;   :ensure t
;;   :config
;;   (load-theme 'solarized-dark t))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-bluloco-dark t))

(custom-theme-set-faces
 'doom-bluloco-dark
 '(region ((t (:background "#3d4451"
               :foreground unspecified
               :distant-foreground unspecified
               :extend t)))))
