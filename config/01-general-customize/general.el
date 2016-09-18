(defun custom-appearance ()
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

(defun custom-global-modes ()
  ;; auto close brackets
  (electric-pair-mode 1)
  (setq major-mode 'text-mode)
  ;; indentation using smart-tabs-mode
  (setq-default tab-width 4))

(defun custom-init-window ()
  (setq inhibit-splash-screen t)
  (setq initial-scratch-message 'nil)
  (add-to-list 'default-frame-alist '(width  . 120))
  (add-to-list 'default-frame-alist '(height . 30))
  (setq split-height-threshold 0)
  (setq split-width-threshold nil)
  (add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-10"))
  ;; set chinese font
  (set-fontset-font "fontset-default"  '(#x4e00 . #x9fbf) "YaHei Consolas Hybrid-8"))


(defun custom-default-coding ()
  ;; default charset utf-8
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8))

;; collect all custom functions
(defun custom-general ()
  (custom-appearance)
  (custom-global-modes)
  (custom-init-window)
  (custom-default-coding))

;; call all custom
(custom-general)

