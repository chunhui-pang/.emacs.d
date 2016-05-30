(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode 1)
(display-time-mode 1)
(setq display-time-24hr-format t)
(global-linum-mode 1)
(setq linum-format "%5d\u2502 ")
(electric-pair-mode 1)
(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 30))
(add-to-list 'default-frame-alist '(font . "YaHei Consolas Hybrid-10"))
(set-fontset-font "fontset-default"  '(#x4e00 . #x9fbf) "YaHei Consolas Hybrid-8") ;set chinese font
(setq inhibit-splash-screen t)
(setq major-mode 'text-mode)
(setq initial-scratch-message 'nil)
;;; default charset utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;(setq default-buffer-file-coding-system 'utf-8)

(setq split-height-threshold 0)
(setq split-width-threshold nil)


(global-set-key (kbd "C-<tab>")
		(lambda () (interactive)
		  (switch-to-buffer (other-buffer))))

