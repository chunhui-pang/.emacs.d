;;; init.el --- personal emacs config -*- lexical-binding: t; -*-

;;; --- package system ---------------------------------------------------------
(require 'package)
(setq package-repos '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                      ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-archives package-repos)
(package-initialize)

;;; --- use-package bootstrap --------------------------------------------------
;; First-run on a fresh machine: install use-package before requiring it.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;; --- emacs server -----------------------------------------------------------
(require 'server)
(defun always-start-server ()
  "Start the Emacs server if it is not already running."
  (unless (server-running-p)
    (server-start)))

;;; --- config loader ----------------------------------------------------------
(defun load-el-file-from-directory (directory)
  "Load every .el file directly under DIRECTORY (non-recursive, alphabetical)."
  (when (and (stringp directory) (file-accessible-directory-p directory))
    (message "load config directory %s..." directory)
    (dolist (f (directory-files directory t "^[^#].*\\.el$"))
      (load f))))

(defun load-config-directory ()
  "Load every .el file under ~/.emacs.d/config/<sub-dir>/<file>.el.
Sub-directories are traversed in filename order (00-, 01-, ...),
files inside each sub-directory are loaded in filename order too."
  (let ((conf-dir (expand-file-name "config" user-emacs-directory)))
    (when (file-accessible-directory-p conf-dir)
      (dolist (sub-dir (directory-files conf-dir t "^[0-9a-zA-Z].*$"))
        (when (file-directory-p sub-dir)
          (message "Loading from directory %s" sub-dir)
          (dolist (f (directory-files sub-dir t "^[0-9a-zA-Z].*\\.el$"))
            (load f)))))))

(always-start-server)
(load-config-directory)

;;; --- custom-file ------------------------------------------------------------
;; Keep Emacs' auto-generated customize block out of init.el.
;; Add /custom.el to .gitignore so per-machine state stays local.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
