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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends '(company-abbrev company-files))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" default))
 '(package-selected-packages
   '(yaml-mode lsp-java rustic rust-mode multi-vterm vterm solarized-theme jq-mode restclient-jq restclient pyim-basedict pyim magit which-key swiper protobuf-mode nerd-icons neotree lsp-ui lsp-ivy json-mode irony go-mode find-file-in-project exec-path-from-shell elpy disable-mouse dap-mode company-posframe company-dict company-box))
 '(safe-local-variable-values
   '((eval pyvenv-activate local-venv-path)
     (eval message "find local python virtual environment %s" local-venv-path)
     (eval set
           (make-local-variable 'local-venv-path)
           (concat
            (file-name-directory
             (let
                 ((d
                   (dir-locals-find-file ".")))
               (if
                   (stringp d)
                   d
                 (car d))))
            "venv/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
