;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Fixes bug with tabs and adds auto-completion.
(defun my-asm-mode-hook ()
  ;; Bug Fix.
  "Fix bug with tabulation in assembly mode."
  (local-unset-key (vector asm-comment-char))
  (setq tab-always-indent (default-value 'tab-always-indent))
  ;; Auto-completion.
  (auto-complete-mode))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; assembler.el ends here
