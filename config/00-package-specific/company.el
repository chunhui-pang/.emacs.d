;;; company-mode config
(use-package company-box
  :hook (company-mode . company-box-mode))

;; (use-package company :defer t
;;   :hook (after-init . global-company-mode))

(global-set-key (kbd "<backtab>") 'company-complete-common)


(use-package company-dict :defer t)
(setq company-dict-enable-yasnippet nil)
(setq company-dict-dir (concat "/home/chunhui/.emacs.d/" "dict/"))

(use-package company-posframe :defer t)
(company-posframe-mode 1)
