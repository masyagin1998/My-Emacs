;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of programming languages.

;;; Code:

;;; Base settings.
(require 'auto-complete-config) ;; Autocomplete.
(require 'popup)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")

(add-hook 'after-init-hook #'global-flycheck-mode) ;; Syntax analyzer.
(add-to-list 'display-buffer-alist ;; Run flycheck as status bar.
             `(,(rx bos "*Flycheck errors*" eos)
	       (display-buffer-reuse-window
		display-buffer-in-side-window)
	       (side . bottom)
	       (reusable-frames . visible)
	       (window-height . 0.1)))

(require 'yasnippet) ;; Snippets.
(yas-global-mode t)
(yas-load-directory "~/.emacs.d/elpa/yasnippet-classic-snippets-1.0.2/snippets")

;;; Golang.
(load-file "~/.emacs.d/init/programming/golang.el")

;;; С\С++.
(load-file "~/.emacs.d/init/programming/cpp.el")

;;; Assembler.
(load-file "~/.emacs.d/init/programming/assembler.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; programming.el ends here
