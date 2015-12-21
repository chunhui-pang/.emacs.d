;;; window size
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;;; switch window
(defun set-win32-window-move-key ()
  (global-set-key [C-M-up] 'windmove-up)
  (global-set-key [C-M-down] 'windmove-down)
  (global-set-key [C-M-left] 'windmove-left)
  (global-set-key [C-M-right] 'windmove-right)
  (message "setting up window move key for windows"))
(defun set-default-window-move-key ()
  (global-set-key [s-left] 'windmove-left) 
  (global-set-key [s-right] 'windmove-right) 
  (global-set-key [s-up] 'windmove-up) 
  (global-set-key [s-down] 'windmove-down)
  (message "setting up window move key to default scheme"))

(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
    (set-win32-window-move-key)
  (set-default-window-move-key))
