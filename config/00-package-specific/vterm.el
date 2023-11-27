(defun customize-vterm-settings ()
  (let ((shell-name (os-type-choose-value "bash" nil "bash" "zsh")))
    (when shell-name (setq vterm-shell shell-name)))

  (setq-default vterm-use-vterm-prompt-detection-method nil)
  (setq-default term-prompt-regexp "^.*[%#\$]\\W")
  (setq vterm-timer-delay 0.005))

(defun vterm-set-root-host-name ()
  (interactive)
  (save-excursion
    (let ((match-begin (search-backward-regexp "@.*:" nil t)))
      (if match-begin
          (let ((hostname (buffer-substring (+ match-begin 1) (- (match-end 0) 1))))
            (let ((prefix (read-string (concat "Hostname is: " hostname ", please input an optional prefix: "))))
              (progn
                (if (> (length prefix) 0)
                    (setq prefix (concat prefix "-")))
                (rename-buffer (concat prefix hostname)))))
        (message "Guess no valid host name.")))))

(use-package vterm
  :config
  (customize-vterm-settings)
  :bind (:map vterm-mode-map
              ("ESC ESC" . vterm-send-ecsape)
              ("M-H" . nil)
              ("M-J" . nil)
              ("M-K" . nil)
              ("M-L" . nil)
              ("M-H" . nil)
              ("C-\\" . nil)
              ("C-SPC" . nil)
              ("M-SPC" . nil)
              ("<f1>" . nil)
              ("<f2>" . nil)
              ("<f3>" . nil)
              ("<f4>" . nil)
              ("<f5>" . nil)
              ("<f6>" . nil)
              ("<f7>" . nil)
              ("<f8>" . nil)
              ("<f9>" . nil)
              ("<f10>" . nil)
              ("<f11>" . nil)
              ("<f12>" . nil)
              ("C-SPC" . vterm-copy-mode)
              ("C-c C-s" . vterm-set-root-host-name)))
(use-package multi-vterm)
