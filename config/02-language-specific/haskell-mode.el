(defun custom-haskell-general ()
  (custom-set-variables
   '(haskell-mode-hook (quote (turn-on-haskell-indent)))))

(defun custom-haskell-enable-other-modes ()
  (outline-minor-mode 1))

(defun custom-haskell ()
  (message "custom for haskell environment...")
  (custom-haskell-general)
  (custom-haskell-enable-other-modes))

(add-hook 'haskell-mode 'custom-haskell)
