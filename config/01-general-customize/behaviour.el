;;; decoding
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
  (setq custom-directory nil)
  (cond ((or
          (eq system-type 'ms-dos)
          (eq system-type 'windows-nt)
          (eq system-type 'cygwin))
         (setq custom-directory "d:/workspace/"))
        ((or
          (eq system-type 'gnu)
          (eq system-type 'gnu/linux))
         (setq custom-directory "~/Workspace/")))
  (when custom-directory
    (message "default workspace set to %s" custom-directory)
    (setq default-directory custom-directory)))

;;; custom for backup strategy
(defun custom-for-backup ()
  (setq custom-backup-dir nil)
  (cond ((or
          (eq system-type 'ms-dos)
          (eq system-type 'windows-nt)
          (eq system-type 'cygwin))
         (setq custom-backup-dir "d:/workspace/.emacsbackup/"))
        ((or
          (eq system-type 'gnu)
          (eq system-type 'gnu/linux))
         (setq custom-backup-dir "~/Workspace/.emacsbackup/")))
  (when custom-backup-dir
    (message "set backup directory to %s" custom-backup-dir)
    (unless (file-accessible-directory-p custom-backup-dir)
      (make-directory custom-backup-dir t))
    (setq backup-by-copying t)
    (setq backup-directory-alist `((".*" . ,custom-backup-dir)))
    (setq delete-old-versions t)
    (setq kept-new-versions 6)
    (setq kept-old-versions 2)
    (setq version-control t)))

(defun custom-for-appointments ()
  (appt-activate)
  (setq org-agenda-files '("~/Workspace/tasklist"))
  (global-set-key (kbd "C-c a") 'org-agenda))

(defun custom-for-others ()
  (setq ring-bell-function 'ignore)
  (setq x-select-enable-clipboard t)
  (add-hook 'before-save-hook
            'delete-trailing-whitespace))

(defun custom-emacs-behaviour ()
  (custom-for-encoding)
  (custom-for-modes)
  (custom-for-default-directory)
  (custom-for-backup)
  (custom-for-appointments)
  (custom-for-others))

(custom-emacs-behaviour)
