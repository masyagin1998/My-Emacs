;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of Golang.

;;; Code:

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
  :ensure t)

;; Golangci-lint settings.
(use-package flycheck-golangci-lint
  :ensure t
  :init
  (setq flycheck-golangci-lint-config (concat (getenv "HOME") "/.emacs.d/init/programming/go/golangci.yml"))
  :hook
  (go-mode . flycheck-golangci-lint-setup)
  (go-mode . go-eldoc-setup))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; go.el ends here
