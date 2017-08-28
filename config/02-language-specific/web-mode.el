(require 'company-tern)
;;; web mode
(defun global-web-mode-config ()
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(defun custom-web-general ()
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-indent-style 4)

  (setq web-mode-style-padding 4)
  (setq web-mode-script-padding 4)
  (setq web-mode-block-padding 0)

  (setq nxml-child-indent 4)
  (setq nxml-attribute-indent 4)
  (setq nxml-slash-auto-complete-flag 4)

  (define-key web-mode-map (kbd "<backtab>") 'company-web-html))

(defun custom-web-enable-other-modes ()
  (outline-minor-mode 1))

(defun custom-web ()
  (message "custom for web environment...")
  (custom-web-enable-other-modes)
  (custom-web-general))

(global-web-mode-config)
(add-hook 'web-mode-hook 'custom-web)



                           
