;; custom for js2-mode

(defun custom-js2-enable-other-modes ()
  (tern-mode)
  (company-mode))

(defun custom-js2-general ()
  (add-to-list 'company-backends 'company-tern))
  
(defun custom-js2-keybinding ()
  ;; Disable completion keybindings, as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil))


(defun custom-js2-mode ()
  (message "custom for js2-mode")
  (custom-js2-enable-other-modes)
  (custom-js2-general)
  (custom-js2-keybinding))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'custom-js2-mode)

