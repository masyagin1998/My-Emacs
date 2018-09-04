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

;; ##############################################
;; ####### Package management settings. #########
;; ##############################################

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

;; ##############################################
;; ############# Backups settings. ##############
;; ##############################################

;; No backup files.
(setq make-backup-files nil)
;; No autosaves lists.
(setq auto-save-list-file-name nil)
;; No autosaves.
(setq auto-save-default nil)

;; ##############################################
;; ########## Text-writing settings. ############
;; ##############################################

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

;; ##############################################
;; ############## Themes settings. ##############
;; ##############################################

(load-file "~/.emacs.d/init/theme/theme.el")

;; ##############################################
;; ########### Programming settings. ############
;; ##############################################

 (load-file "~/.emacs.d/init/programming/programming.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet use-package powerline neotree flycheck-golangci-lint flx-ido auto-complete all-the-icons))))
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
