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
  (set-face-attribute 'region nil :background "#888"))

(defun custom-for-font ()
  (setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))
  (set-face-attribute 'default nil :font "Source Code Pro-13")
  (set-fontset-font t 'han      (font-spec :family "STkaiti"))
  (set-fontset-font t 'cjk-misc (font-spec :family "STkaiti")))

(defun custom-for-appearance ()
  (custom-for-window)
  (custom-for-font)
  (custom-for-display))

(add-hook 'after-init-hook 'custom-for-appearance)
