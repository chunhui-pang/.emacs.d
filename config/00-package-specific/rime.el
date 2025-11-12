;; rime should be compiled in manual, see: https://github.com/rime/librime/blob/master/README-mac.md
;; after compile, the following commands should be executed in build directory
;; mkdir include; cp ../src/rime_api.h include/
(use-package rime
  :custom
  (default-input-method "rime")
  (rime-librime-root "~/.emacs.d/librime/build/")
  (rime-show-candidate 'posframe))
