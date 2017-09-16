(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(setq package-list 
      '(monokai-theme
        neotree
        yasnippet
        company
        ;; latex
        auctex
        company-auctex
        company-math
        ;; c/cpp
        ggtags
        irony
        rtags
        company-c-headers
        company-irony
        ;; javascript
        js2-mode
        js2-refactor
        tern
        company-tern
        ;; html and css
        web-mode
        company-web
        ;; python
        elpy
        flycheck
        ;; markdown
        markdown-mode
        ))
(setq package-contents-refreshed nil)
(mapc (lambda (pkg)
	(unless (package-installed-p pkg)
	  (message "install package %s ..." pkg)
	  (unless package-contents-refreshed
	    (package-refresh-contents)
	    (setq package-contents-refreshed t))
	  (package-install pkg)))
      package-list)


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
 '(company-backends (quote (company-elisp company-abbrev company-files)))
 '(package-selected-packages
   (quote
    (rtags neotree monokai-theme markdown-mode js2-refactor ggtags flycheck epc elpy company-tern company-math company-irony company-go company-c-headers company-auctex auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#ffffff"))))
 '(company-scrollbar-fg ((t (:background "#ffffff"))))
 '(company-tooltip ((t (:inherit default :background "#ffffff"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))
