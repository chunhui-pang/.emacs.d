(defun customize-for-yaml-mode ()
  (yafolding-mode)
  (setq truncate-lines t))

(add-hook 'yaml-mode-hook 'customize-for-yaml-mode)
(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'hs-minor-mode)
