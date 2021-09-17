;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; This is Emacs theme configuration file.

;;; Code:

;; If Emacs is in terminal, use "arc-dark-terminal" theme
;; else use "arc-dark-gui" theme.
(setq custom--inhibit-theme-enable nil)
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

;; Simple file-roller in bottom of Emacs.
(use-package flx-ido
  :ensure t
  :init
  (ido-mode t)
  (ido-everywhere t)
  (flx-ido-mode t)
  (setq ido-use-faces nil))

;; Main file-roller in the right part of Emacs.
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-expand-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'right
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-litter-directories            '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             nil
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-width-is-initially-locked     nil
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

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
