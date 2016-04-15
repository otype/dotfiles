;; get Powerline loaded BEFORE loading moe-theme
(require 'powerline)
(require 'moe-theme)

;; activate powerline AFTER we have enabled moe-theme
(powerline-moe-theme)

;; set font
(set-default-font "Monaco 14")

;; moe configuration
(setq moe-theme-highlight-buffer-id t)

;; Change mode-line color
;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
(moe-theme-set-color 'yellow)

;; Finally, apply our moe theme!
(moe-dark)

;; disable scrollbar
(scroll-bar-mode -1)

;; enable line numbers
(global-linum-mode 1)
