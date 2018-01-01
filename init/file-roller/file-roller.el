;;; package --- Summary

;; Copyright (C) 2014 , masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Simple file roller in status bar.
(require 'flx-ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-use-faces nil)

;; Powerful file roler.
(require 'neotree)
;; Position.
(setq neo-window-position 'right)
(setq neo-window-fixed-size nil)
;; Theme.
(require 'all-the-icons)
(setq neo-theme 'icons)
;; Show hidden files.
(setq-default neo-show-hidden-files t)
;; Open neotree in current folder.
(setq neo-smart-open t)
;; Auto refresh root folder.
(setq neo-autorefresh t)
;; Keyboars shortcut.
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; file-roller.el ends here
