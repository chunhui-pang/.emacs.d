(defun global-markdown-config ()
  (autoload 'markdown-mode "markdown-mode"
	"Major mode for editing Markdown files" t)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(defun custom-markdown-enable-other-modes ()
  (outline-minor-mode 1))

(defun custom-markdown ()
  (message "custom for markdown environment...")
  (custom-markdown-enable-other-modes))

(global-markdown-config)
(add-hook 'markdown-mode-hook 'custom-markdown)
