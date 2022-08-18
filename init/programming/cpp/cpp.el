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

;; C\C++ environment.

(defun lsp-cpp-add-directory (dir)
  "Add directory DIR to CPATH and LSP list."
  (if (string= (getenv "CPATH") "")
      (setenv "CPATH" dir)
    (setenv "CPATH" (string-join (list (getenv "CPATH") dir) ":")))
  (lsp-workspace-folders-add dir))

(defun lsp-cpp-init-directories (dirs ap-dirs)
  "Init directories from DIRS with excluded directories from AP-DIRS for C\\C++ lsp mode."
  (setq dirs (directories-dirs-recursively-filtered dirs ap-dirs))
  (setenv "CPATH" "")
  (while dirs
    (lsp-cpp-add-directory (car dirs))
    (setq dirs (cdr dirs))))

;; s38-firmware.
;; Base.
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/include/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/masters/include/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/drivers/nios-drivers/include/")
;; Tests.
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/fw/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/lib/autotest/include/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/autotest/lib/mips_support/include/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/autotest/tests/include/")
(lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/s38-firmware/drivers/nios-drivers/tests/include/")

;; fbl2
;; Base.
;; (lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/fbl2/src/")
;; (lsp-cpp-add-directory "/home/mikhail/Work/projects/s38/src/fbl2/include/")

;; Before-save hooks to format buffer.
(defun lsp-cpp-install-save-hooks ()
  "Run tabify and trailing whitespaces remover before saving C or C++ file."
  (add-hook 'before-save-hook 'tabify-all)
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

;; C\C++ mode.
(use-package cc-mode
  :ensure t
  :init
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c-mode-hook 'format-all-mode)
  (add-hook 'c-mode-hook 'display-fill-column-indicator-mode)
  (add-hook 'c-mode-hook (lambda () (setq display-fill-column-indicator-column 81)))
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'format-all-mode)
  (add-hook 'c++-mode-hook 'display-fill-column-indicator-mode)
  (add-hook 'c++-mode-hook (lambda () (setq display-fill-column-indicator-column 81))))

(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
