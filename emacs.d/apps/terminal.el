(require 'multi-term)

;; we are using zsh
(setq multi-term-program "/usr/local/bin/zsh")

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)
