(require 'package)
(require 'server)

(setq package-repos '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/")
                      ("elpy" . "http://jorgenschaefer.github.io/packages/")))
(setq default-repo "melpa")

(if (not (and (fboundp 'server-start-p) (server-running-p)))
    (server-start))

(package-initialize)
(setq package-list 
      '(;; dependencies
        (let-alist . "gnu")
        (seq . "gnu")
        ;; utils
        (monokai-theme . nil)
        (neotree . nil)
        (yasnippet . nil)
        (company . nil)
        (company-dict . nil)
        (find-file-in-project . nil)
        ;; latex
        (auctex . "gnu")
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
        (company-tern . nil)
        ;; html and css
        (web-mode . nil)
        (company-web . nil)
        ;; python
        (elpy . "elpy")
        (flycheck . nil)
        ;; markdown
        (markdown-mode . nil)
        ))

(defun install-packages ()
  ;; select repository
  (setq current-repo nil)
  (defun using-repo (name)
    (unless name
      (setq name default-repo))
    (unless (eq current-repo name)
      (setq current-repo name)
      (setq package-archives (cons (assoc current-repo package-repos) nil))
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode rtags rich-minority neotree monokai-theme markdown-mode js2-refactor ggtags flycheck elpy company-web company-tern company-math company-irony company-dict company-c-headers company-auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
