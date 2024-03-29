(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

(push '(scroll-bar-mode . nil) default-frame-alist)
(push '(tool-bar-mode . nil) default-frame-alist)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defvar os-type-gnu (memq system-type '(gnu gnu/linux)))
(defvar os-type-win (memq system-type '(ms-dos windows-nt cygwin)))
(defvar os-type-mac (eq system-type 'darwin))
(defun os-type-choose-value (default-value &optional win-value gnu-value mac-value)
  (cond (os-type-gnu (if gnu-value gnu-value default-value))
        (os-type-win (if win-value win-value default-value))
        (os-type-mac (if mac-value mac-value default-value))
        (t default-value)))
