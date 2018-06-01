;; (use-package solarized-theme
;;   :defer t
;;   :init
;;   (load-theme 'solarized-dark t))

(use-package moe-theme
  :ensure t
  :defer t)

(use-package powerline
  :ensure t)

(require 'powerline)
(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'blue)
(powerline-moe-theme)
(moe-dark)

;; fix powerline separators
(setq powerline-default-separator 'utf-8)

(provide 'base-theme)
