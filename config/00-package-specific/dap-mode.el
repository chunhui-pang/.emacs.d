(use-package dap-mode :defer t)

(require 'dap-gdb-lldb)

(setq dap-auto-configure-features '(sessions locals controls tooltip))
(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                                   :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))
