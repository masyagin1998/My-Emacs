;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of JavaScript.

;;; Code:

;; JSON.
(use-package json-mode
  :ensure t)

;; YAML.
(use-package yaml-mode
  :ensure t)

;; TOML.
(use-package toml-mode
  :ensure t)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; configs.el ends here
