;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; Common user-defined functions and utils.

;;; Code:

(defun tabify-all ()
  "Tabify all file."
  (tabify (point-min) (point-max)))

(defun untabify-all ()
  "Untabify all file."
  (untabify (point-min) (point-max)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; common.el ends here
