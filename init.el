;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is my Emacs config for Golang, C\C++ and some other languages.

;;; Code:

;; Basic settings.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/init/basic/basic.el")

;; Programming settings.
(load-file "~/.emacs.d/init/programming/programming.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here
