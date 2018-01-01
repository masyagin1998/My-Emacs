;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Initialize packages.
(package-initialize)

;; Theme settings.
(load-file "~/.emacs.d/init/theme/theme.el")

;; Encoding settings.
(load-file "~/.emacs.d/init/encoding/encoding.el")

;; Package-Manager settings.
(load-file "~/.emacs.d/init/package-manager/package-manager.el")

;; Backups & Saves settings.
(load-file "~/.emacs.d/init/backups & saves/backups & saves.el")

;; File-Roller settings.
(load-file "~/.emacs.d/init/file-roller/file-roller.el")

;; Programming settings.
(load-file "~/.emacs.d/init/programming/programming.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here
