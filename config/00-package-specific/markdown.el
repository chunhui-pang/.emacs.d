(use-package markdown-mode :defer t
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'" . markdown-mode))
  :hook
  (outline-minor-mode))
