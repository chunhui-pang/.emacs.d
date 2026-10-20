;; -*- lexical-binding: t; -*-

;;; decoding
(defun custom-for-encoding ()
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8))

;;; default modes and indents
(defun custom-for-modes ()
  ;; auto close brackets
  (electric-pair-mode 1)
  (ido-mode 1)
  (winner-mode 1)
  (setq major-mode 'text-mode)
  ;; indentation using smart-tabs-mode
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4))

;;; default directory
(defun custom-for-default-directory ()
  (let ((custom-directory (os-type-choose-value "~/Workspace/" "d:/workspace/")))
    (message "default workspace set to %s" custom-directory)
    (setq default-directory custom-directory)))

;;; custom for backup strategy
(defun custom-for-backup ()
  (let ((custom-backup-dir (os-type-choose-value "~/Workspace/.emacsbackup/" "d:/workspace/.emacsbackup/")))
    (message "set backup directory to %s" custom-backup-dir)
    (unless (file-accessible-directory-p custom-backup-dir)
      (make-directory custom-backup-dir t))
    (setq backup-directory-alist `((".*" . ,custom-backup-dir))))
  (setq backup-by-copying t)
  (setq delete-old-versions t)
  (setq kept-new-versions 6)
  (setq kept-old-versions 2)
  (setq version-control t))

(defun custom-for-others ()
  (setq ring-bell-function 'ignore)
  (setq mouse-drag-copy-region t)
  (setq x-select-enable-clipboard t)
  (add-hook 'before-save-hook
            'delete-trailing-whitespace))

;;; mouse support in TTY (Alacritty / terminal Emacs)
(defun custom-for-mouse ()
  "TTY 下启用 xterm 鼠标协议：左键定位光标、拖拽选区、滚轮滚屏开箱可用。"
  (unless (display-graphic-p)
    (xterm-mouse-mode 1))
  ;; 关掉 mouse-1 的 link 判断延迟（默认 450ms），让单击立刻定位光标。
  (setq mouse-1-click-follows-link nil))

(defun custom-emacs-behaviour ()
  (custom-for-encoding)
  (custom-for-modes)
  (custom-for-default-directory)
  (custom-for-backup)
  (custom-for-others)
  (custom-for-mouse))

(custom-emacs-behaviour)
