(use-package dap-mode
  :ensure t
  :config
  (dap-auto-configure-mode)
  (require 'dap-lldb) ;; Manually require dap-lldb
  (require 'dap-gdb-lldb) ;; Also required for LLDB debugging
  (require 'dap-cpptools)) 

