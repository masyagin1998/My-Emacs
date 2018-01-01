;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Fix bug with tabs.
(defun my-asm-mode-hook ()
  "Fix bug with tabulation in assembly mode."
  (local-unset-key (vector asm-comment-char))
  (setq tab-always-indent (default-value 'tab-always-indent))
  (auto-complete-mode))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; assembly.el ends here
