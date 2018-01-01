;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Identation.
(setq c-basic-offset 4)

;; Smart syntax analyzer.
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; c.el ends here
