;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is configuration of Rust.

;;; Code:

;; Before-save hooks to format buffer and add/delete imports.
(defun lsp-rust-install-save-hooks ()
  "Run rustfmt before saving Rust file."
  (add-hook 'before-save-hook 'lsp-format-buffer t t))

;; Rust mode.
(use-package rustic
  :ensure t
  :init
  (add-hook 'rustic-mode-hook 'lsp)
  (add-hook 'rustic-mode-hook 'lsp-rust-install-save-hooks)
  (add-hook 'rustic-mode-hook '(lambda ()
								 (setq-default indent-tabs-mode nil
                                               c-basic-indent 4
                                               tab-width 4))))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; rust.el ends here
