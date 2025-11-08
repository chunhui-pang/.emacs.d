(defun customize-for-common-programming ()
  (yafolding-mode)
  (setq truncate-lines t))

(add-hook 'prog-mode-hook 'customize-for-common-programming)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)
