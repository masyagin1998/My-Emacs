;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of programming languages.

;;; Code:

;; Language Server Protocol Support for Emacs.
(use-package lsp-mode
  :ensure t)

;; Auto-completion.
(use-package popup
  :ensure t)
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Code analysis.
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

;; Snippets.
(use-package yasnippet-snippets
  :ensure t)
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode t)
  (yasnippet-snippets-initialize)
  (yas-load-directory yasnippet-snippets-dir))

;; C\C++ settings.
(load-file "~/.emacs.d/init/programming/cpp/cpp.el")
;; Golang settings.
(load-file "~/.emacs.d/init/programming/go/go.el")
;; Rust settings.
(load-file "~/.emacs.d/init/programming/rust/rust.el")
;; Bash settings.
(load-file "~/.emacs.d/init/programming/bash/bash.el")

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; programming.el ends here
