;;; company-mode config
(require 'company)
(require 'color)
(global-set-key (kbd "<backtab>") 'company-complete-common)
(add-hook 'after-init-hook 'global-company-mode)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))))
					; company-c-headers
(defun company-c-header-hook ()
  (add-to-list 'company-backends 'company-c-headers))
(add-hook 'c-mode-hook 'company-c-header-hook)
(add-hook 'c++-mode-hook 'company-c-header-hook)


;; adjust company backend priority
(custom-set-variables
 '(company-backends
   (quote
	(company-clang company-c-headers company-irony company-nxml company-css company-eclim company-semantic company-abbrev company-cmake company-capf company-files company-bbdb company-xcode
				   (company-dabbrev-code company-gtags company-etags company-keywords)
				   company-oddmuse company-dabbrev)))
)

