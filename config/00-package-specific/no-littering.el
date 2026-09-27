;;; no-littering.el --- Keep the .emacs.d root tidy -*- lexical-binding: t; -*-
;; Redirects package state files (ido.last, tramp, transient/, lsp-session,
;; recentf, url/, request/, auto-save/, backups, ...) into
;;   ~/.emacs.d/etc/  (never-changing shipped data)
;;   ~/.emacs.d/var/  (frequently-changing runtime state)
(use-package no-littering
  :ensure t
  :demand t
  :init
  (setq no-littering-etc-directory (expand-file-name "etc/" user-emacs-directory)
        no-littering-var-directory (expand-file-name "var/" user-emacs-directory))
  :config
  ;; auto-save + backup follow no-littering conventions
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
  (setq backup-directory-alist
        `((".*" . ,(no-littering-expand-var-file-name "backup/"))))
  ;; keep no-littering internals out of recentf
  (with-eval-after-load 'recentf
    (add-to-list 'recentf-exclude no-littering-var-directory)
    (add-to-list 'recentf-exclude no-littering-etc-directory)))
