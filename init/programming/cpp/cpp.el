;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of C\C++.

;;; Code:

;; C\C++ environment.
(setenv "CPATH" "...:...:...")

;; C\C++ mode.
(use-package cc-mode
  :ensure t
  :init
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp))

;; Common.
(lsp-workspace-folders-add "...")
(lsp-workspace-folders-add "...")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
