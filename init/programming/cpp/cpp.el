;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Identation.
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)

;; Smart syntax analyzer.
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
