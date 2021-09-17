;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of C\C++.

;;; Code:

;; C\C++ environment.
(setenv "CPATH" "...:...:...")

;; Before-save hooks to format buffer.
(defun lsp-cpp-install-save-hooks ()
  "Run tabify and trailing whitespaces remover before saving C or C++ file."
  (add-hook 'before-save-hook 'tabify-all)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

;; C\C++ mode.
(use-package cc-mode
  :ensure t
  :init
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'c-mode-hook 'lsp-cpp-install-save-hooks)
  (add-hook 'c++-mode-hook 'lsp-cpp-install-save-hooks)
  (setq lsp-enable-on-type-formatting nil))

(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

;; Projects.
(lsp-workspace-folders-add "...")
(lsp-workspace-folders-add "...")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
