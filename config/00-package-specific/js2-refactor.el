(require 'js2-refactor)

;; enable js2-refactor in js2-mode
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")

