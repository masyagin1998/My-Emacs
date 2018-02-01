;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;;; Base settings.

;; IDE by projectile.
(require 'projectile)

;; Paren mode.
(setq show-paren-style 'expression)
(show-paren-mode t)

;; Auto complete.
(require 'auto-complete-config)
;; Enable popup windows.
(require 'popup)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170124.1845/dict")

;; Snippets.
;; (require 'yasnippet)
;; (yas-global-mode t)
;; (yas-load-directory "~/.emacs.d/elpa/yasnippet-20170923.1646/snippets")

;; Folding (...), {...}, [...].
(require 'hideshow)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<f9>") 'hs-toggle-hiding)

;; Syntao Analyzer.
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
	       (display-buffer-reuse-window
		display-buffer-in-side-window)
	       (side . bottom)
	       (reusable-frames . visible)
	       (window-height . 0.2)))

;;; Assembly settings.
(load-file "~/.emacs.d/init/programming/assembler/assembler.el")

;;; C\C++ settings.
(load-file "~/.emacs.d/init/programming/c/c.el")

;;; Golang settings.
(load-file "~/.emacs.d/init/programming/go/go.el")

;;; Python settings.
(load-file "~/.emacs.d/init/programming/python/python.el")

;;; Web settings.
(load-file "~/.emacs.d/init/programming/web/web.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; programming.el ends here
