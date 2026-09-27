;;; company.el --- -*- lexical-binding: t; -*-
;;; company-mode config
(use-package company-box
  :hook (company-mode . company-box-mode))

;; (use-package company :defer t
;;   :hook (after-init . global-company-mode))

(global-set-key (kbd "M-TAB") 'completion-at-point)


(use-package company-dict :defer t)
(setq company-dict-enable-yasnippet nil)
(setq company-dict-dir (expand-file-name "dict/" user-emacs-directory))

(use-package company-posframe :defer t)
(company-posframe-mode 1)
