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

;; C\C++-GCC linter settings.
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))
(add-hook 'c-mode-hook (lambda () (setq flycheck-gcc-language-standard "c11")))
(defun get-all-directories-recursively (parent-dir)
  "Get all DIRS from PARENT-DIR."
  (let ((all-dirs-and-files (directory-files-recursively parent-dir "" t))
        (all-dirs '()))
    (while all-dirs-and-files
      (if (file-directory-p (car all-dirs-and-files))
          (setq all-dirs (append all-dirs (list (expand-file-name (car all-dirs-and-files))))))
      (setq all-dirs-and-files (cdr all-dirs-and-files)))
    (append all-dirs (list parent-dir))))
(defun remove-directory-anti-pattern (all-dirs dir-anti-pattern)
  "Remove all directories matching DIR-ANTI-PATTERN from ALL-DIRS."
    (let (remaining-dirs '())
    (while all-dirs
      (if (not (s-starts-with? (expand-file-name dir-anti-pattern) (car all-dirs)))
          (setq remaining-dirs (append remaining-dirs (list (expand-file-name(car all-dirs))))))
      (setq all-dirs (cdr all-dirs)))
    remaining-dirs))
(add-hook 'c-mode-hook
          (lambda () (setq flycheck-gcc-include-path (remove-directory-anti-pattern (get-all-directories-recursively "") ""))))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-gcc-include-path (remove-directory-anti-pattern (get-all-directories-recursively "") ""))))

;; C\C++-headers autocompletion.
(setq ac-disable-faces nil)
(defun my:ac-c-headers-init ()
  "Initialize C and C++ headers autocompletion."
  (use-package auto-complete-c-headers
    :ensure t)
  (add-to-list 'ac-sources 'ac-source-c-headers)
    (add-to-list 'achead:include-directories '"/usr/include/c++/5
     /usr/include/x86_64-linux-gnu/c++/5
     /usr/include/c++/5/backward
     /usr/lib/gcc/x86_64-linux-gnu/5/include
     /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
     /usr/include/x86_64-linux-gnu
     /usr/lib/gcc/x86_64-linux-gnu/5/include
     /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
     /usr/include/x86_64-linux-gnu
     /usr/local/include
     /usr/include
    "))
(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; cpp.el ends here
