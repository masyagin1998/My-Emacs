;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of Golang.

;;; Code:

;; Golang environment.
(add-to-list 'exec-path "/usr/local/go/bin")
(add-to-list 'exec-path "/home/mikhail/Golang/bin")
(setenv "GOROOT" "/usr/local/go")
(setenv "GOPATH" "/home/mikhail/Go")
(setenv "GOBIN" "/home/mikhail/Go/bin")

;; Go mode.
(use-package go-mode
  :ensure t
  :init
  (add-hook 'go-mode-hook 'lsp))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  "Run gofmt and goimports before saving Go file."
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; go.el ends here
