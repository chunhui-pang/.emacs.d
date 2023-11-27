(require 'package)
(require 'use-package-ensure)
(require 'server)


(setq package-repos '(("gnu" . "https://elpa.gnu.org/packages/")
                      ("melpa" . "https://melpa.org/packages/")))
(setq package-archives package-repos)
(setq use-package-always-ensure t)

(defun always-start-server ()
  (if (not (and (boundp 'server-process)
                (server-running-p)))
      (server-start)))


(defun load-el-file-from-directory (directory)
  (if (and (stringp directory) (file-accessible-directory-p directory))
      (progn
        (message "load config directory %s..." directory)
        (mapc 'load
              (mapcar
               (lambda (x) (expand-file-name x directory))
               (directory-files directory nil "^[^#].*el$"))))
    (if directory (message "directory %s cannot be loaded..." directory))))

(defun load-config-directory ()
  (setq conf-dir (expand-file-name "config" user-emacs-directory))
  (when (file-accessible-directory-p conf-dir)
    (setq sub-dirs (directory-files conf-dir t "^[0-9a-zA-Z].*$"))
    (mapc
     (lambda (sub-dir)
       (progn
         (message "Loading from directory %s" sub-dir)
         (setq conf-files (directory-files sub-dir t "^[0-9a-zA-Z].*\.el$"))
         (mapc 'load  conf-files)))
     sub-dirs)))

(package-initialize)
(always-start-server)
(load-config-directory)
