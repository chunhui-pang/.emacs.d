;; (require 'neotree)
(use-package neotree :defer t
  :config
  (setq neo-smart-open t)
  :bind
  ([f8] . neotree-toggle))
