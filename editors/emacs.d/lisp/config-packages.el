;;; package --- Packages configuration
;;; Commentary:
;;; This includes all configurations around packages

;;; Code:

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
(use-package moe-theme :ensure t)
(use-package mwim :ensure t)
(use-package neotree :ensure t)
(use-package powerline :ensure t)
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
