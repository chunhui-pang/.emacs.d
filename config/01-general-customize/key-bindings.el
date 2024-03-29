;; customize window adjusting keys
(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
)

(defun adjust-window-size ()
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)
  (global-set-key (kbd "C-x 4") 'split-3-windows-horizontally-evenly)
  (global-set-key (kbd "<f11>") 'toggle-frame-fullscreen))

;;; customize window switching keys
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

(defun set-vim-style-window-move-key ()
  (global-set-key (kbd "M-H") 'windmove-left)
  (global-set-key (kbd "M-J") 'windmove-down)
  (global-set-key (kbd "M-K") 'windmove-up)
  (global-set-key (kbd "M-L") 'windmove-right)
  (message "setting up window move key to vim style"))

(defun switch-among-windows ()
  ;; (if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  ;;     (set-win32-window-move-key)
  ;;   (set-default-window-move-key)))
  (set-vim-style-window-move-key))

;; customize buffer switching keys
(defun custom-buffer-operations ()
  (global-set-key (kbd "C-<tab>")
                  (lambda () (interactive) (switch-to-buffer (other-buffer))))
  (global-set-key (kbd "C-{") 'previous-buffer)
  (global-set-key (kbd "C-}") 'next-buffer)
  (global-set-key (kbd "C-x C-r") 'rename-buffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer))


;;; compile customization
(defun my-compile ()
  "Run compile and resize the compile window"
  (interactive)
  (progn
    (call-interactively 'compile)
    (setq cur (selected-window))
    (setq w (get-buffer-window "*compilation*"))
    (select-window w)
    (select-window cur)))

(defun custom-for-compile ()
  (global-set-key [f9] 'my-compile)
  (setq compilation-scroll-output t))

(defun open-env-info ()
  (interactive)
  (if (file-exists-p "~/Workspace/tasklist/notes/env_info.org")
      (switch-to-buffer (find-file-noselect "~/Workspace/tasklist/notes/env_info.org"))))

(defun custom-quick-file ()
  (message "custom for open quick file")
  (global-set-key (kbd "<f10>") 'open-env-info))


(defun custom-for-other-keys ()
  (global-set-key (kbd "C-x C-t") 'multi-vterm))

(defun custom-key-binding ()
  (adjust-window-size)
  (switch-among-windows)
  (custom-buffer-operations)
  (custom-for-compile)
  (custom-for-other-keys)
  (custom-quick-file))

(custom-key-binding)
