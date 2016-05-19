;; Load MELPA
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; load all packages from Homebrew
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; list of packages to be installed automatically
(use-package markdown-mode :ensure t)
(use-package powerline :ensure t)
(use-package moe-theme :ensure t)
(use-package mu4e-maildirs-extension :ensure t)
(use-package lua-mode :ensure t)
(use-package groovy-mode  :ensure t)
(use-package multi-term :ensure t)
(use-package go-mode :ensure t)
(use-package drag-stuff :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package ensime
  :ensure t
  :commands ensime ensime-mode)
;(use-package auto-complete :ensure t)
(use-package company :ensure t)
(use-package company-lua :ensure t)
(use-package company-go :ensure t)
(use-package company-shell :ensure t)
(use-package helm :ensure t)
(use-package helm-company :ensure t)
(use-package jdee :ensure t)
(use-package projectile :ensure t)
(use-package neotree :ensure t)
(use-package ag :ensure t)
(use-package elixir-mode :ensure t)
(use-package alchemist :ensure t)
(use-package magit :ensure t)
(use-package yaml-mode :ensure t)
(use-package which-key :ensure t)
