;;; package --- Summary

;; Copyright (C) 2018 , masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is Emacs theme configuration file.

;;; Code:

;; ##############################################
;; ############# Themes switching. ##############
;; ##############################################

;; If Emacs is in terminal, use "arc-dark-terminal" theme
;; else use "arc-dark-gui" theme.
(if (not (display-graphic-p))
    (progn
      (load-file "~/.emacs.d/init/theme/arc-dark-terminal.el")
      (menu-bar-mode -1) (tool-bar-mode -1))
  (progn
    (load-file "~/.emacs.d/init/theme/arc-dark-gui.el")
    (use-package powerline
      :ensure t
      :init
      (powerline-default-theme))
    (defun use-fancy-splash-screens-p ()
      "Return t if fancy splash screens should be used."
      (when (and (display-graphic-p)
		 (or (and (display-color-p)
			  (image-type-available-p 'xpm))
                     (image-type-available-p 'pbm)))
	(let ((frame (fancy-splash-frame)))
	  (when frame
	    (let* ((img (create-image (fancy-splash-image-file)))
		   (image-height (and img (cdr (image-size img nil frame))))
		   (frame-height (1- (frame-height frame))))
	      (> frame-height (+ image-height 17)))))))
    (menu-bar-mode 1) (tool-bar-mode -1)))
;; Display line numbers.
(global-display-line-numbers-mode)
;; No dialog boxes.
(setq use-dialog-box nil)
;; Cursor not blinking.
(blink-cursor-mode -1)

;; ##############################################
;; ########### File-roller settings. ############
;; ##############################################

;; Simple file-roller in bottom of Emacs.
(use-package flx-ido
  :ensure t
  :init
  (ido-mode t)
  (ido-everywhere t)
  (flx-ido-mode t)
  (setq ido-use-faces nil))
;; Main file-roller in the right part of Emacs
;; with "all-the-icons" theme.
(use-package neotree
  :ensure t
  :init
  (setq neo-window-position 'right)
  (setq neo-window-fixed-size nil))
(use-package all-the-icons
  :ensure t
  :init
  (setq neo-theme 'icons)
  (setq-default neo-show-hidden-files t)
  (setq neo-smart-open t)
  (setq neo-autorefresh t)
  (global-set-key (kbd "<f8>") 'neotree-toggle))
;; List of opened files and buffers.
(use-package bs
  :ensure t
  :init
  (setq bs-configurations '(("files" "^\\*scratch\\*" nil nil
			     bs-visits-non-file
			     bs-sort-buffer-interns-are-last))))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; theme.el ends here
