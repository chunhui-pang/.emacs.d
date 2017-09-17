;;; company-mode config
(require 'company)

(global-set-key (kbd "<backtab>") 'company-complete-common)
(add-hook 'after-init-hook 'global-company-mode)

