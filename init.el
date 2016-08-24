					; packet manage initialize
(require 'package)
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
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
	  (message "install package %s ..." pkg)
	  (package-install pkg)))
      package-list)


;; util functions
(defun load-el-file-from-directory (directory)
  (when (file-exists-p directory)
    (mapc 'load
	  (mapcar (lambda (x) (expand-file-name x directory))
		  (directory-files config-dir nil "^[^#].*el$")))))


;;; load theme
(load-theme 'monokai t)
;;; load config directory
(setq config-dir
      (expand-file-name "config" user-emacs-directory))
(load-el-file-from-directory config-dir)


