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
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; disable tool bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; disable menu-bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;; Line numbering
(setq linum-format "%d ")

;; enable line numbering for text-mode
(add-hook 'text-mode-hook 'linum-mode)

;; enable line numbering for any programming language mode
(add-hook 'prog-mode-hook 'linum-mode)

;; Remove the strange white line between two fringes.
;(set-face-attribute 'vertical-border nil :foreground (face-attribute 'fringe :background))

;; We also want to get rid of the splash screen and start in the home directory.
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq initial-buffer-choice "~/")

;; Let's set the height and width of the window. The last line gets rid of the ugly bright white line when splitting a window.
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 150))

;; paren mode = show matching parenthesis
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;; We want to show trailing whitespace. Trailing whitespace is the devil.
(require 'whitespace)
(setq-default show-trailing-whitespace t)

;; ... but sometimes (especially in read-only buffers that I don't control), this gets annoying. Which is why we can add this small function to any hook that we want:
(defun no-trailing-whitespace ()
  (setq show-trailing-whitespace nil))

;; We already know two places to add it: the minibuffer and eww.
(add-hook 'mu4e-compose-mode-hook
	  'no-trailing-whitespace)
(add-hook 'minibuffer-setup-hook
          'no-trailing-whitespace)
(add-hook 'eww-mode-hook
	  'no-trailing-whitespace)
;(add-hook 'ielm-mode-hook
;          'no-trailing-whitespace)
;(add-hook 'gdb-mode-hook
;          'no-trailing-whitespace)
(add-hook 'help-mode-hook
          'no-trailing-whitespace)
(add-hook 'term-mode-hook
          'no-trailing-whitespace)

;; Highlight current line. Globally enable this, turn off when not needed.
(global-hl-line-mode 1)
(make-variable-buffer-local 'global-hl-line-mode)

;; Insert closing parens automagically
(electric-pair-mode 1)

;; alias 'sh' for multi-term
(defalias 'sh 'multi-term)
