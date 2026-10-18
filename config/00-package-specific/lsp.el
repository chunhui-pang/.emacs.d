;;; lsp.el --- -*- lexical-binding: t; -*-
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :config
  ;; dap-mode.el 比本文件先加载，并且 (require 'lsp-mode) 把 lsp-mode 提前拉起来，
  ;; 此时 lsp-mode-map 在 defvar 时按默认 prefix "s-l" 建好 lsp-command-map 绑定；
  ;; 之后再 setq lsp-keymap-prefix 不会触发重绑，所以这里显式兜底一次。
  (define-key lsp-mode-map (kbd "s-l") nil)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
