(require 'package)
(require 'server)

(setq package-repos '(("gnu" . "https://elpa.gnu.org/packages/")
                      ("melpa" . "https://melpa.org/packages/")))
(setq default-repo "melpa")

(if (not (and (boundp 'server-process)
              (server-running-p)))
    (server-start))

(setq package-list
      '(;; dependencies
        ;; gnu repo
        (let-alist . "gnu")
        (seq . "gnu")
        (project . "gnu")
        (auctex . "gnu")
        (xr . "gnu")

        ;; melpa repo
        ;; utils
        (cl-lib . nil)
        (monokai-theme . nil)
        (dracula-theme . nil)
        (solarized-theme . nil)
        (neotree . nil)
        (yasnippet . nil)
        (company . nil)
        (company-posframe . nil)
        (company-dict . nil)
        (exec-path-from-shell . nil)

        (find-file-in-project . nil)
        (sml-modeline . nil)
        (disable-mouse . nil)
        ;; latex

        (company-auctex . nil)
        (company-math . nil)
        ;; c/cpp
        (ggtags . nil)
        (irony . nil)
        (rtags . nil)
        (company-c-headers . nil)
        (company-irony . nil)
        ;; javascript
        (js2-mode . nil)
        (js2-refactor . nil)
        (tern . nil)
        ;; (company-tern . nil)
        ;; html and css
        (web-mode . nil)
        (company-web . nil)
        ;; python
        (flycheck . nil)
        (jedi . nil)
        (elpy . nil)
        ;; markdown
        (markdown-mode . nil)
        (protobuf-mode . nil)
        ;; input
        (pyim . nil)
        (pyim-basedict . nil)
        (vterm . nil)
        (multi-vterm . nil)
        ;; go
        (go-mode . nil)))

(defun install-packages ()
  ;; select repository
  (setq current-repo nil)
  (defun using-repo (name)
    (unless name
      (setq name default-repo))
    (unless (eq current-repo name)
      (setq current-repo name)
      (setq package-archives (cons (assoc current-repo package-repos) nil))
      (package-initialize)
      (package-refresh-contents)))

  (dolist (package package-list)
    (setq package-name (car package)
          package-repo (cdr package))
    (unless (package-installed-p package-name)
      (using-repo package-repo)
      (message "install package %s from %s" package-name (cdr (car package-archives)))
      (package-install package-name))))

(install-packages)
(setq package-archives package-repos)


;; util functions
(defun load-el-file-from-directory (directory)
  (if (and (stringp directory) (file-accessible-directory-p directory))
      (progn
        (message "load config directory %s..." directory)
        (mapc 'load
              (mapcar
               (lambda (x) (expand-file-name x directory))
               (directory-files directory nil "^[^#].*el$"))))
    (if directory (message "directory %s cannot be loaded..." directory))))

(defun load-config-directory-sequential (directory)
  (when (file-exists-p directory)
    (message "load configs: %s" (directory-files directory nil "^[0-9]+-.*$"))
    (mapc 'load-el-file-from-directory
          (mapcar
           (lambda (x)
             (if (file-accessible-directory-p (expand-file-name x directory))
                 (expand-file-name x directory)
               (progn
                 (message "file %s cannot be loaded..." x)
                 nil)))
           (directory-files directory nil "^[0-9]+-.*$")))))


;;; load config directory
(setq config-dir
      (expand-file-name "config" user-emacs-directory))
(load-config-directory-sequential config-dir)
