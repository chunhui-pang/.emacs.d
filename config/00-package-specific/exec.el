;; load extra bin
(use-package exec-path-from-shell
  :ensure t
  :when (or (memq window-system '(mac ns x))
            (unless os-type-win
              (daemonp)))
  :init (exec-path-from-shell-initialize))
