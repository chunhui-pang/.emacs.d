(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; (global-set-key (kbd "<backtab>") 'jedi:complete)
;; (defun run-python-once ()
;;   (remove-hook 'python-mode-hook 'run-python-once)
;;   (run-python))
;; (add-hook 'python-mode-hook 'run-python-once)

