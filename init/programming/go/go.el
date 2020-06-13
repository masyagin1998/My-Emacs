;;; package --- Summary

;; Copyright (C) 2020, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of Golang.

;;; Code:


(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))
(setenv "GOPATH" "/home/mikhail/Golang")
(add-to-list 'exec-path "/home/mikhail/Golang/bin")

;; Go mode.
(use-package go-mode
  :ensure t)

;; Formatting.
(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")

;; Auto-completion.
(use-package go-autocomplete
  :ensure t)
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; Code information.
(use-package go-guru
  :ensure t)
(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

;; Gometalinter linter settings.
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))
(setq flycheck-gometalinter-deadline "10s")
;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; only show errors
(setq flycheck-gometalinter-errors-only f)
;; only run fast linters
(setq flycheck-gometalinter-fast t)

;; Golangci-lint linter settings.
;(use-package flycheck-golangci-lint
;  :ensure t
  ; :init
  ; (setq flycheck-golangci-lint-config (concat (getenv "HOME") "/.emacs.d/init/programming/go/golangci.yml"))
;  :hook
;  (go-mode . flycheck-golangci-lint-setup)
;  (go-mode . go-eldoc-setup))



;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; go.el ends here
