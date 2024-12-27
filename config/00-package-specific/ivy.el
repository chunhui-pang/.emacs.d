(use-package ivy :demand
  :bind (("C-c u" . ivy-resume))
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")
  (ivy-mode))

(use-package swiper
  :bind (("C-s" . swiper-isearch))
  :config
  (setq swiper-action-recenter t
        ;; Jump to the beginning of match when leaving Swiper
        swiper-goto-start-of-match t))
