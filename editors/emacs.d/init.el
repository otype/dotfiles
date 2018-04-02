;;; package --- emacs initialization file
;;;
;;; Commentary:
;;; - Some of the defaults have been taken from https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/

;;; CODE:

;;;
;;; Set up use-package
;;;

;; tells emacs not to load any packages before starting up
(setq package-enable-at-startup nil)

;; the following lines tell emacs where on the internet to look up for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)   ; unless it is already installed
  (package-refresh-contents)                 ; updage packages archive
  (package-install 'use-package))            ; and install the most recent version of use-package
(require 'use-package)

;;;
;;; PACKAGES
;;;

;; Loaded on Emacs start ...
(use-package ag :ensure t)
(use-package avy :ensure t :commands (avy-goto-word-1))
(use-package company :ensure t)
(use-package counsel-projectile :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package general :ensure t)
(use-package mwim :ensure t)
(use-package neotree :ensure t)
(use-package solarized-theme :ensure t)
(use-package swiper :ensure t)
(use-package which-key :ensure t)

;; Lazy-loaded (when needed) ...
(use-package company-go :ensure t :defer t)
(use-package go-guru :ensure t :defer t)
(use-package go-mode :ensure t :defer t)
(use-package gotest :ensure t :defer t)
(use-package go-errcheck :ensure t :defer t)

;;;
;;; CONFIGURATIONS
;;;

;; config: Add a directory to the load path so we can put extra files there
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Load the configuration files
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
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (which-key mwim company-go nlinum gotest ag go-guru neotree solarized-theme atom-one-dark go-mode company counsel-projectile avy general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
