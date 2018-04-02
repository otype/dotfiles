;;; package --- Custom configuration
;;; Commentary:
;;; This includes all custom configurations which wouldn't make it into
;;; a big configuration file.

;;; Code:

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to cktput backups file
(setq vc-follow-symlinks t )		; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq fill-column 80)                   ; toggle wrapping text at the 80th character

(setq-default indent-tabs-mode nil)
(setq-default js2-basic-offset 2
              js-indent-level 2)        ; use 2 spaces in Javascript/JSON
;;(setq js2-strict-missing-semi-warning nil)
(setq-default python-indent-offset 4)

(tool-bar-mode -1)                      ; disable the button bar atop screen
(scroll-bar-mode -1)                    ; Disable scroll bar
(set-frame-font "Monaco 14")            ; Set font and size
(load-theme 'wombat)                    ; load given theme

(fset 'yes-or-no-p 'y-or-n-p)           ; yes -> y, no -> n

;; HIGHLIGHTING
(global-hl-line-mode t)                 ; enable highlight configuration
(require 'hl-line)
(set-face-background 'hl-line "#2f4f4f")
;;(set-face-attribute 'region nil :background "#707899" :foreground "#c1cdc1")
;;(set-face-attribute hl-line-face nil :underline nil)
;;(set-face-background 'highlight nil)
(set-cursor-color "#FEFF00")

(global-linum-mode t)                   ; enable line numbers

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
  )

;; Fetch various ENV variables
(setq exec-path-from-shell-check-startup-files nil)
(setq exec-path-from-shell-variables '("PATH"
                                       "MANPATH"
                                       "RBENV_ROOT"
                                       "PYENV_ROOT"
                                       "GOPATH"
                                       "GOROOT"
                                       ))

(provide 'config-custom)
;;; config-custom.el ends here
