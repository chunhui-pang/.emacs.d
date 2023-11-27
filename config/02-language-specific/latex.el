;;; latex environment
(defun custom-latex-auctex ()
  ;; add support latexmk compile command
  (push
   '("Latexmk" "latexmk -pdf %(mode) %s" TeX-run-TeX nil t
	 :help "Run Latexmk on file")
   TeX-command-list)
  ;; custom font faces
  (custom-set-faces
   '(font-latex-bold-face ((t nil)))
   '(font-latex-doctex-documentation-face ((t nil)))
   '(font-latex-doctex-preprocessor-face ((t nil)))
   '(font-latex-italic-face ((t nil)))
   '(font-latex-math-face ((t nil)))
   '(font-latex-sectioning-0-face ((t nil)))
   '(font-latex-sectioning-1-face ((t nil)))
   '(font-latex-sectioning-2-face ((t nil)))
   '(font-latex-sectioning-3-face ((t nil)))
   '(font-latex-sectioning-4-face ((t nil)))
   '(font-latex-sectioning-5-face ((t nil)))
   '(font-latex-sedate-face ((t nil)))
   '(font-latex-slide-title-face ((t nil)))
   '(font-latex-string-face ((t nil)))
   '(font-latex-subscript-face ((t nil)))
   '(font-latex-superscript-face ((t nil)))
   '(font-latex-verbatim-face ((t nil)))
   '(font-latex-warning-face ((t nil))))
  (setq font-latex-fontify-sectioning 'color)
  (setq font-latex-script-display (quote (nil)))
  (setq font-latex-deactivated-keyword-classes
		'("italic-command" "bold-command" "italic-declaration" "bold-declaration")))

;; adjust priorities of company backends
(defun custom-latex-company ()
  (company-auctex-init)
  (custom-set-variables
   '(company-backends
	 (quote
	  (company-latex-commands company-math-symbols-unicode company-abbrev company-files)))))

(defun custom-latex-enable-other-modes ()
  (outline-minor-mode 1))

(defun custom-latex ()
  (message "custom for latex environment...")
  (custom-latex-auctex)
  (custom-latex-company)
  (custom-latex-enable-other-modes))

(add-hook 'LaTeX-mode-hook 'custom-latex)
