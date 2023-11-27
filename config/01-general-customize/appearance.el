;; custom for window
(defun custom-for-window ()
  ;; hide menu, bar, scroll bar
  (tool-bar-mode -1)
  (if (fboundp 'scroll-bar-mode)
      (scroll-bar-mode -1))
  (menu-bar-mode -1)
  ;; display time
  (display-time-mode 1)
  (setq display-time-24hr-format t))

;;; custom for emacs display
(defun custom-for-display ()
  (setq inhibit-splash-screen t)
  (setq initial-scratch-message 'nil)
  (add-to-list 'default-frame-alist '(width  . 120))
  (add-to-list 'default-frame-alist '(height . 30))
  (setq split-height-threshold 0)
  (setq split-width-threshold nil)
  ;; (add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-12"))
  ;; set chinese font
  ;; (set-fontset-font "fontset-default"  '(#x4e00 . #x9fbf) "YaHei Consolas Hybrid-10")
  (add-to-list 'default-frame-alist '(font . "Fira Code-12")))


(defun custom-for-appearance ()
  (custom-for-window)
  (custom-for-display))

(add-hook 'after-init-hook 'custom-for-appearance)
