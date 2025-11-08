(use-package yafolding
  :ensure t)

(define-key yafolding-mode-map (kbd "<C-return>") nil)
(define-key yafolding-mode-map (kbd "C-c <C-return>") 'yafolding-toggle-element)
