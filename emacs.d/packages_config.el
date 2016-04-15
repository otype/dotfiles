;; Load MELPA
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package markdown-mode :ensure t)
(use-package powerline :ensure t)
(use-package moe-theme :ensure t)
(use-package mu4e-maildirs-extension :ensure t)
(use-package lua-mode :ensure t)
(use-package groovy-mode  :ensure t)

(use-package drag-stuff :ensure t)
(drag-stuff-global-mode 1)

;; Scala
;(use-package scala-mode2 :ensure t)
(use-package ensime
  :ensure t
  :commands ensime ensime-mode)
(add-hook 'scala-mode-hook 'ensime-mode)

(use-package go-mode :ensure t)
(require 'go-mode-autoloads)

(use-package auto-complete :ensure t)
(ac-config-default)

(use-package jdee  :ensure t)
(require 'jdee)

