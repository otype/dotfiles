;;; package --- Packages configuration
;;; Commentary:
;;; This includes all configurations around packages

;;; Code:

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
;;; Packages
;;;

;; Loaded on Emacs start ...
(use-package ag :ensure t)
(use-package avy :ensure t :commands (avy-goto-word-1))
(use-package company :ensure t)
(use-package counsel-projectile :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package general :ensure t)
(use-package magit :ensure t)
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

(provide 'config-packages)
;;; config-packages.el ends here
