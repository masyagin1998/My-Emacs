;;; package --- Summary

;; Copyright (C) 2021, masyagin1998

;; Author: masyagin1998
;; https://github.com/masyagin1998
;; Version: 1.2
;; Package-Requires: ((emacs "27"))

;; This file is not part of Emacs.

;;; Commentary:
;; Common user-defined functions and utils.

;;; Code:

(defun tabify-all ()
  "Tabify all file."
  (tabify (point-min) (point-max)))

(defun untabify-all ()
  "Untabify all file."
  (untabify (point-min) (point-max)))


(defun directory-dirs-recursively (dir regexp)
  "Get all subdirectories from DIR matching REGEXP."
  (let ((all (directory-files-recursively dir regexp t))
	(dirs (list (expand-file-name dir))))
    (while all
      (if (file-directory-p (car all))
	  (setq dirs (append dirs (list (expand-file-name (car all))))))
      (setq all (cdr all)))
    dirs))

(defun directories-dirs-recursively (dregs)
  "Get all subdirectories from DREGS matching regexp.
DIR is a first element of each DREGS pair.
REGEXP is a second element of each DREGS pair."
  (let (dirs '())
    (while dregs
      (setq cur-dreg (car dregs))
      (setq dirs (append dirs (directory-dirs-recursively (car cur-dreg) (nth 1 cur-dreg))))
      (setq dregs (cdr dregs)))
    dirs))

(defun dirs-to-dregs (dirs)
  "Map DIRS to DREGS used in MULTI-DIRECTORY-DIRS-RECURSIVELY."
  (mapcar #'(lambda (x) (list x "")) dirs))

(defun remove-directory-antipattern (dirs ap-dir)
  "Remove all directories from DIRS equal to antipattern directory AP-DIR."
  (-filter (lambda (x) (not (string= x ap-dir))) dirs))

(defun remove-directory-antipatterns (dirs ap-dirs)
  "Remove all directories from DIRS equal to one of antipattern directories in AP-DIRS."
  (while ap-dirs
    (setq dirs (remove-list-antipattern dirs (car ap-dirs)))
    (setq ap-dirs (cdr ap-dirs)))
  dirs)

(defun directories-dirs-recursively-filtered (dirs ap-dirs)
  "Get list of all directories from DIRS and their subdirectories with excluded directories from AP-DIRS."
  (remove-directory-antipatterns (directories-dirs-recursively (dirs-to-dregs dirs)) ap-dirs))

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; common.el ends here
