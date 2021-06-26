;; (require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)


(defun go-to-task-list ()
  (interactive)
  (neotree-dir "~/Workspace/tasks"))

(global-set-key [f12] 'go-to-task-list)

 
