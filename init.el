;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is my Emacs config for Golang, C\C++ and some other languages.

;;; Code:

;; Repositories.
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))
;; Initialization of "use-package".
(require 'package)
(package-initialize)
;; "use-package" adds another one level of abstraction
;; for Emacs Lisp packages.
(unless (package-installed-p 'use-package)
  (message "EMACS install use-package.el")
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Emacs keybindings with Russian keymap.
(defun cfg:reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))
(cfg:reverse-input-method 'russian-computer)

;; No backup files.
(setq make-backup-files nil)
;; No autosaves lists.
(setq auto-save-list-file-name nil)
;; No autosaves.
(setq auto-save-default nil)

;; Delete selection
(delete-selection-mode t)
;; Auto-close brackets.
(electric-pair-mode 1)
;; Paren mode (highlight code in brackets).
(show-paren-mode t)
(setq show-paren-style 'expression)
;; Folding (...), {...}, [...].
(use-package hideshow
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'hs-minor-mode)
  (global-set-key (kbd "<f9>") 'hs-toggle-hiding))

;; Some string functions.
(use-package s
  :ensure t)

;; Theme settings.
(load-file "~/.emacs.d/init/theme/theme.el")
;; Programming languages settings.
(load-file "~/.emacs.d/init/programming/programming.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-c-headers yasnippet-snippets use-package s powerline neotree go-guru go-eldoc go-autocomplete flycheck-golangci-lint flx-ido all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here
