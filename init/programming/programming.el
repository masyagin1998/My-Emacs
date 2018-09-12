;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of programming languages.

;;; Code:

;; Identation.
(setq-default c-basic-offset 4
	          tab-width 4
	          indent-tabs-mode nil)

;; Auto-completion.
(use-package popup
  :ensure t)
(use-package auto-complete-config
  :ensure auto-complete
  :init
  (ac-config-default)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20170125.245/dict"))

;; Snippets.
(use-package yasnippet-snippets
  :ensure t)
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t)
  (yasnippet-snippets-initialize)
  (yas-load-directory yasnippet-snippets-dir))
;; Online code analyzer.
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (add-to-list
   'display-buffer-alist
   `(,(rx bos "*Flycheck errors*" eos)
     (display-buffer-reuse-window
      display-buffer-in-side-window)
     (side . bottom)
     (reusable-frames . visible)
     (window-height . 0.2))))

;; Jump to definition.
(use-package dumb-jump
  :ensure t
  :init
  (setq dumb-jump-force-searcher 'rg)
  (setq dumb-jump-default-project "~/C/Norsi-Trans/example/example"))

;; Go 1.11 settings.
(load-file "~/.emacs.d/init/programming/go/go.el")
;; C\C++ settings.
(load-file "~/.emacs.d/init/programming/cpp/cpp.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; programming.el ends here
