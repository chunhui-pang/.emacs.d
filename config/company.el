;;; company-mode config
(require 'company)
(require 'color)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "<backtab>") 'company-complete-common)
(add-hook 'after-init-hook 'global-company-mode)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
					; company-c-headers
(defun company-c-header-hook ()
  (add-to-list 'company-backends 'company-c-headers))
(add-hook 'c-mode-hook 'company-c-header-hook)
(add-hook 'c++-mode-hook 'company-c-header-hook)


