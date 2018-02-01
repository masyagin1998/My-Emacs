;;; package --- Summary

;; Copyright (C) 2017, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "25"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

;; Initialize packages.
(package-initialize)

;; Theme settings.
(load-file "~/.emacs.d/init/theme/theme.el")

;; Encoding settings.
(load-file "~/.emacs.d/init/encoding/encoding.el")

;; Package-Manager settings.
(load-file "~/.emacs.d/init/package-manager/package-manager.el")

;; Backups & Saves settings.
(load-file "~/.emacs.d/init/backups & saves/backups & saves.el")

;; File-Roller settings.
(load-file "~/.emacs.d/init/file-roller/file-roller.el")

;; Programming settings.
(load-file "~/.emacs.d/init/programming/programming.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nginx-mode web-mode yasnippet s powerline nlinum neotree go-projectile go-autocomplete flycheck-gometalinter flx-ido exec-path-from-shell all-the-icons))))
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
