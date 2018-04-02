;;; package --- emacs initialization file
;;;
;;; Commentary:
;;; - Some of the defaults have been taken from https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/

;;; CODE:

;; config: Add a directory to the load path so we can put extra files there

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Load the configuration files
(require 'config-packages)
(require 'config-moe-theme)
(require 'config-general)
(require 'config-custom)
(require 'config-go)
(require 'config-ivy)
(require 'config-company)
(require 'config-which)

;;; --------------------------------------------------------------------------------
;;;
;;; CUSTOM SET VARIABLES
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("291588d57d863d0394a0d207647d9f24d1a8083bb0c9e8808280b46996f3eb83" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (moe-theme powerline magit which-key mwim company-go nlinum gotest ag go-guru neotree solarized-theme atom-one-dark go-mode company counsel-projectile avy general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
