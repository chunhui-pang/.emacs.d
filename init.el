(require 'package)
(require 'server)

(setq package-repos '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
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
        (dracula-theme . nil)
        (solarized-theme . nil)
        (neotree . nil)
        (yasnippet . nil)
        (company . nil)
        (company-posframe . nil)
        (company-dict . nil)
        (find-file-in-project . nil)
	    (sml-modeline . nil)
        (disable-mouse . nil)
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
        ;; (js2-mode . nil)
        ;; (js2-refactor . nil)
        (tern . nil)
        ;; (company-tern . nil)
        ;; html and css
        ;; (xr . "gnu")
        (web-mode . nil)
        ;; (company-web . nil)
        ;; python
        (flycheck . nil)
        ;; markdown
        (markdown-mode . nil)
        ;; input
        (pyim . nil)
        (vterm . nil)
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
 '(company-backends
   '((company-clang company-c-headers company-files company-cmake)
     (company-irony company-c-headers company-files company-cmake)))
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(protobuf-mode all-the-icons zenburn-theme web-mode vterm-toggle tern solarized-theme sml-modeline rtags pyim neotree multi-vterm monokai-theme melancholy-theme markdown-mode js2-refactor go-mode ggtags flycheck find-file-in-project exec-path-from-shell dracula-theme disable-mouse company-web company-posframe company-math company-irony company-dict company-c-headers company-auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
