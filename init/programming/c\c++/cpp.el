;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of C\C++.

;;; Code:

;; C++ version.
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))
(add-hook 'c-mode-hook (lambda () (setq flycheck-gcc-language-standard "c11")))

;(add-hook 'c-mode-hook
;          (lambda () (setq flycheck-gcc-include-path
;                           (list  (expand-file-name "~/C/Norsi-Trans/example/example")
;                                  (expand-file-name "~/C/Norsi-Trans/example/example/include/transport")))))

(defun get-all-directories-recursively (parent-dir)
  (let ((all-dirs-and-files (directory-files-recursively parent-dir "" t))
        (all-dirs '()))
    (while all-dirs-and-files
      (if (file-directory-p (car all-dirs-and-files))
          (setq all-dirs (append all-dirs (list (expand-file-name (car all-dirs-and-files))))))
      (setq all-dirs-and-files (cdr all-dirs-and-files)))
    (append all-dirs (list parent-dir))))

(defun remove-directory-anti-pattern (all-dirs dir-anti-pattern)
    (let (remaining-dirs '())
    (while all-dirs
      (if (not (s-starts-with? (expand-file-name dir-anti-pattern) (car all-dirs)))
          (setq remaining-dirs (append remaining-dirs (list (expand-file-name(car all-dirs))))))
      (setq all-dirs (cdr all-dirs)))
    remaining-dirs))

(add-hook 'c-mode-hook
          (lambda () (setq flycheck-gcc-include-path (remove-directory-anti-pattern (get-all-directories-recursively "") ""))))



;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
