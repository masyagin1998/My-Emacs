;;; package --- Summary

;; Copyright (C) 2018, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.1
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:
;; Web-Programming stuff configuration.
;;; Code:

;; ##############################################
;; ########### html, xml, js, php ###############
;; ##############################################

;; Syntax highlighting for html*, xml, js and php.
(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode)))

;; ##############################################
;; ################### nginx ####################
;; ##############################################

;; Syntax highlightiing for nginx config files.
(use-package nginx-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.nginx\\'" . nginx-mode)))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; web.el ends here
