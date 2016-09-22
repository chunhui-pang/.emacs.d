;; package manage initialize
(require 'package)
(setq need-refresh-package-contents nil)
(setq repo-list
	  (quote
	   (("melpa" . "http://melpa.org/packages/")
		("gnu" . "http://elpa.gnu.org/packages/"))))
(when (>= emacs-major-version 24)
  (mapc
   (lambda (repo)
	 (when (not (member repo package-archives))
	   (message "add repo to package-archieves: %s" repo)
	   (add-to-list 'package-archives repo)
	   (setq need-refresh-package-contents t)))
   repo-list))
(package-initialize)
(setq package-list 
      '(auctex
		auto-complete
		company      
		company-auctex     
		company-c-headers 
		company-irony      
		company-math       
		company-web        
		concurrent         
		ctable             
		dash               
		deferred           
		epc                
		ggtags             
		irony              
		jedi               
		jedi-core          
		math-symbol-lists 
		monokai-theme      
		org                
		popup              
		python-environment
		web-completion-data
		web-mode           
		yasnippet          
		))
(mapc (lambda (pkg)
		(unless (package-installed-p pkg)
		  (if need-refresh-package-contents
			  (progn
				(message "%s" "refresh package contents...")
				(package-refresh-contents)
				(setq need-refresh-package-contents nil)))
		  (message "install package %s ..." pkg)
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


;;; load theme
(load-theme 'monokai t)
;;; load config directory
(setq config-dir
	  (expand-file-name "config" user-emacs-directory))
(load-config-directory-sequential config-dir)

