;; load server unless it's already running
(load "server")
(unless (server-running-p) (server-start))

;; load all settings files
(load "~/.emacs.d/packages_config") ;; needs to be the first as this installs all packages
(load "~/.emacs.d/general_config") ;; all configuration needed after packages have been setup

;; load all lib files
(load "~/.emacs.d/lib/go-autocomplete")

;; base configurations
(load "~/.emacs.d/base/layout")
(load "~/.emacs.d/base/keybindings")

;; apps configurations
(load "~/.emacs.d/apps/email")
(load "~/.emacs.d/apps/terminal")

;; programming configurations
(load "~/.emacs.d/programming/go")

;; GUI configurations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(custom-safe-themes
   (quote
    ("613a7c50dbea57860eae686d580f83867582ffdadd63f0f3ebe6a85455ab7706" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
