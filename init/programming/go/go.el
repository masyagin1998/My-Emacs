;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Golang PATH and GOPATH.
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
(setenv "GOPATH" "/home/mikhail/Programming/Clike/go")
(add-to-list 'exec-path "/home/mikhail/Programming/Clike/go/bin")

;; Enable formating and importing packages on save,
;; marks and set golang tab-width to 4.
(defun my-go-mode-hook ()
  "Use 4 spaces in Tab."
  (setq tab-width 4)
  "Use goimports instead of go-fmt."
  (setq gofmt-command "goimports")
  "Call Gofmt before saving."
  (add-hook 'before-save-hook 'gofmt-before-save)
  "Godef jump key binding."
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Golang additions for Projectile.
(require 'go-projectile)

;; Smart syntax analyzer.
(require 'go-guru)
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

;; Autocomplete.
;; Base.
(defun auto-complete-for-go ()
  "Enable auto-complete."
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
;; Intelligent.
(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; go.el ends here
