;;; custom for find in project
(require 'find-file-in-project)

;;; cygwin are natively supported, and gnu find are not supported yet???
;; (defun setup-find-binary ()
;;   (when (or (eq system-type 'windows-nt) (eq system-type 'ms-dos))
;;     (unless ffip-find-executable
;;       (setq find-bin-directories '("C:\\GnuWin32\\bin\\find.exe"
;;                                    "D:\\GnuWin32\\bin\\find.exe"))
;;       (while (> (length find-bin-directories) 0)
;;         (setq bin (car find-bin-directories)
;;               find-bin-directories (cdr find-bin-directories))
;;         (when (file-executable-p bin)
;;           ;; replace  \ with \\
;;           (setq bin (replace-regexp-in-string "\\\\" "\\\\\\\\" bin))
;;           (message "using %s as find binary" bin)
;;           (setq ffip-find-executable bin)
;;           (setq find-bin-directories nil))))))
;; (setup-find-binary)

(setq ffip-prefer-ido-mode t)
(global-set-key [f3] 'find-file-in-project-by-selected)

