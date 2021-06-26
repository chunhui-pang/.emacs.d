;;; company-mode config
(require 'company)
(global-set-key (kbd "<backtab>") 'company-complete-common)
(add-hook 'after-init-hook 'global-company-mode)


(require 'company-dict)
(setq company-dict-enable-yasnippet nil)
(setq company-dict-dir (concat "/home/chunhui/.emacs.d/" "dict/"))

(require 'company-posframe)
(company-posframe-mode 1)
