(use-package burly
  :bind (("C-c b w" . burly-bookmark-windows)   ;; 存当前 window 布局
         ("C-c b f" . burly-bookmark-frames)    ;; 存所有 frame
         ("C-c b o" . burly-open-bookmark)))    ;; 用 C-x r b 也能开
