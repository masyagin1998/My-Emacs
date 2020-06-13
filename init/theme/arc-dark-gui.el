;;; package --- Summary

;; Copyright (C) 2020, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.0
;; Package-Requires: ((emacs "26"))

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:
(deftheme arc-dark-gui)

(let ((background "#373B49")
      (current-line "#505050")
      (selection "#b0b0b0")
      (foreground "#e0e0e0")
      (comment "#b0b0b0")
      (cursor "#e0e0e0")
      (red "#ac4142")
      (orange "#d28445")
      (yellow "#f4bf75")
      (green "#90a959")
      (aqua "#75b5aa")
      (blue "#6a9fb5")
      (purple "#aa759f"))

  (custom-theme-set-faces
   'arc-dark-gui

   ;; Built-in stuff (Emacs 25)
   `(default ((t (:background ,background :foreground ,foreground))))
   `(fringe ((t (:background ,current-line))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(mode-line ((t (:background ,current-line :foreground ,foreground))))
   `(region ((t (:background ,selection))))

   ;; Font-lock stuff
   `(font-lock-comment-face ((t (:foreground ,comment))))
   `(font-lock-constant-face ((t (:foreground ,green))))
   `(font-lock-doc-string-face ((t (:foreground ,comment))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,red))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,current-line))))

   ;; linum-mode
   `(linum ((t (:background ,current-line :foreground ,foreground))))

   ;; org-mode
   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-hide ((t (:foreground ,current-line))))
   `(org-link ((t (:foreground ,blue))))
   `(org-todo ((t (:foreground ,red))))

   ;; show-paren-mode
   `(show-paren-match ((t (:background ,blue :foreground ,current-line))))
   `(show-paren-mismatch ((t (:background ,orange :foreground ,current-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,aqua))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,comment))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,foreground)))))

  (custom-theme-set-variables
   'arc-dark-gui

   `(ansi-color-names-vector
     [,background, red, green, yellow, blue, purple, blue, foreground])
   `(ansi-term-color-vector
     [unspecified, background, red, green, yellow, blue, purple, blue, foreground])))

(provide-theme 'arc-dark-gui)
;;; arc-dark-gui.el ends here
