;;; early-init.el --- -*- lexical-binding: t; -*-

;; -- native-comp workaround for Emacs 31 on macOS 27 -------------------------
;; Emacs 31 binary was built with -mmacosx-version-min=18.0 baked into its
;; native-comp driver options, but Apple's macOS versioning went 15 -> 26 (no
;; 18.0 exists), so clang rejects the flag. Setting a valid deployment target
;; in the env before any (native-)compilation subprocess runs restores JIT.
(when (eq system-type 'darwin)
  (setenv "MACOSX_DEPLOYMENT_TARGET" "15.0"))

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

(let ((host-early-init (expand-file-name "early-init-host-specific.el" user-emacs-directory)))
  (when (file-exists-p host-early-init)
    (message "load eary init host specific file: %s" host-early-init)
    (load host-early-init)))
