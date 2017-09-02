;;; custom for tern
(require 'tern)

(defun custom-for-tern-key-binding ()
  (local-set-key (kbd "M-.") 'tern-find-definition))

(add-hook 'js2-mode-hook 'custom-for-tern-key-binding)


