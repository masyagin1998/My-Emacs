;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of Golang.

;;; Code:

;; PATH.
(defun set-exec-path-from-shell-PATH ()
  "Golang path."
  (let
      ((path-from-shell
	(replace-regexp-in-string
	 "[ \t\n]*$"
	 ""
	 (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

;; Documentation.
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(setenv "GOPATH" "/home/mikhail/Golang")
(add-to-list 'exec-path "/home/mikhail/Golang/bin")

;; Autocomplete.
(add-hook 'go-mode-hook (auto-complete-mode 1))
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

;; Error Checking.
(add-hook 'go-mode-hook 'flycheck-mode)
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))
(setq flycheck-gometalinter-vendor t)
(setq flycheck-gometalinter-fast t)

;; Formatting.
(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")

;; Tab width.
(defun my-go-mode-hook ()
  "Use 4 spaces in Tab."
  (setq tab-width 4))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Snippets.
(add-hook 'go-mode-hook 'yas-minor-mode)


;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; golang.el ends here
