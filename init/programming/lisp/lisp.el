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

(add-hook 'emacs-lisp-mode-hook 'format-all-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (setq display-fill-column-indicator-column 81)))
(add-hook 'emacs-lisp-mode-hook 'display-fill-column-indicator-mode)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; lisp.el ends here
