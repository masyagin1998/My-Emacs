;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Choose different themes for GUI and for terminal.
(if (not (display-graphic-p))
    (progn
      (load-file "~/.emacs.d/init/theme/balalaika-terminal.el")
      (menu-bar-mode -1)
      (tool-bar-mode -1))
  (progn
    (load-file "~/.emacs.d/init/theme/balalaika-gui.el")
    (menu-bar-mode 1)
    (tool-bar-mode -1)))

;; Show line numbers.
(add-hook 'prog-mode-hook 'nlinum-mode)
(setq nlinum-format "%3d ")

;; Powerline.
(require 'powerline)
(if (display-graphic-p)
    (progn
      (require 'powerline)
      (powerline-default-theme)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; theme.el ends here
