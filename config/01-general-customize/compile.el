;;; compile customization
(defun my-compile ()
  "Run compile and resize the compile window"
  (interactive)
  (progn
    (call-interactively 'compile)
    (setq cur (selected-window))
    (setq w (get-buffer-window "*compilation*"))
    (select-window w)
    (select-window cur)))

(defun kill-compile-window-if-successful (buffer string)
  "kill the *compilation* window if the compilation is successfully finished"
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (goto-char (point-min))
          (search-forward "warning" nil t))))
	  (run-with-timer 1 nil
                      (lambda (buf)
						(delete-windows-on buf nil)
						(message "compilation finished with neither errors nor warnings, window closed"))
                      buffer)))

(global-set-key [f9] 'my-compile)
(add-hook 'compilation-finish-functions 'kill-compile-window-if-successful)
(setq compilation-scroll-output t)

