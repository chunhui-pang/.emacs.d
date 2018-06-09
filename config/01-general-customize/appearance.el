;; custom for window
(defun custom-for-window ()
  ;; hide menu, bar, scroll bar
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  ;; show line number
  (column-number-mode 1)
  (global-linum-mode 1)
  (setq linum-format "%5d\u2502 ")
  ;; display time
  (display-time-mode 1)
  (setq display-time-24hr-format t))

;;; custom for emacs display
(defun custom-for-display ()
  ;; (load-theme 'monokai t)
  (load-theme 'dracula t)
  (setq inhibit-splash-screen t)
  (setq initial-scratch-message 'nil)
  (add-to-list 'default-frame-alist '(width  . 120))
  (add-to-list 'default-frame-alist '(height . 30))
  (setq split-height-threshold 0)
  (setq split-width-threshold nil)
  (add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-12"))
  ;; set chinese font
  (set-fontset-font "fontset-default"  '(#x4e00 . #x9fbf) "YaHei Consolas Hybrid-10"))


(defun custom-for-appearance ()
  (custom-for-window)
  (custom-for-display))

(add-hook 'after-init-hook 'custom-for-appearance)
