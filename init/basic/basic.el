;;; package --- Summary

;; Copyright (C) 2018 , masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is Emacs basic configuration file (package-manager, backups, file-roller, etc)

;;; Code:

;; Theme.
(if (not (display-graphic-p))
    (progn
      (load-file "~/.emacs.d/init/basic/arc-dark-terminal.el")
      (menu-bar-mode -1) (tool-bar-mode -1))
  (progn
    (load-file "~/.emacs.d/init/basic/arc-dark-gui.el")
    (require 'powerline) (powerline-default-theme)
    (menu-bar-mode 1) (tool-bar-mode -1)))

(add-hook 'prog-mode-hook 'nlinum-mode)
(setq nlinum-format "%3d ")

;; Package-manager.
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

;; Backups.
(setq make-backup-files nil) ;; No backup files.
(setq auto-save-list-file-name nil) ;; No autosaves.
(setq auto-save-default nil) ;; No autosaves.

;; File-roller.
(require 'flx-ido) ;; Simple file roller in status bar.
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-use-faces nil)

(require 'neotree) ;; Powerful file roler.
(setq neo-window-position 'right) ;; Position.
(setq neo-window-fixed-size nil)
(require 'all-the-icons) ;; Theme.
(setq neo-theme 'icons)
(setq-default neo-show-hidden-files t) ;; Show hidden files.
(setq neo-smart-open t) ;; Open neotree in current folder.
(setq neo-autorefresh t) ;; Auto refresh root folder.
(global-set-key (kbd "<f8>") 'neotree-toggle) ;; Keyboard shortcut.

;; List of files.
(require 'bs)
(setq bs-configurations
      '(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

;; Better work with packages.
(require 'use-package)

;; Auto-close brackets.
(electric-pair-mode 1)

;; Paren mode (highlight code in brackets).
(setq show-paren-style 'expression)
(show-paren-mode t)

;; Folding (...), {...}, [...].
(require 'hideshow)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<f9>") 'hs-toggle-hiding)

;; Delete selection
(delete-selection-mode t)

;; Cursor not blinking
(blink-cursor-mode -1)
;; No dialog boxes
(setq use-dialog-box nil)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; basic.el ends here
