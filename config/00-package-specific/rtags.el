;; rtags customization

;; rtags documentation
;;
;; Install
;;     Clone from the git hub, and build it
;;     Copy rdm, rc, rp into the bin directory (/usr/bin/ or other)
;;
;; Key bindings:
;;     Use "M-x rtags-enable-standard-keybindings" to enable key bindings for rtags
;;     Please refer to the source code to see details of key bindings (some important ones are shown as follows)
;;        (setq prefix "C-c r "))
;;        (define-key map (kbd (concat prefix ".")) 'rtags-find-symbol-at-point)
;;        (define-key map (kbd (concat prefix ",")) 'rtags-find-references-at-point)
;;        (define-key map (kbd (concat prefix "v")) 'rtags-find-virtuals-at-point)
;;        (define-key map (kbd (concat prefix "V")) 'rtags-print-enum-value-at-point)
;;


