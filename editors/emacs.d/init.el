;;; package --- emacs initialization file
;;;
;;; Commentary:
;;; - Some of the defaults have been taken from https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/

;;; CODE:
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

;; HIGHLIGHTING
(global-hl-line-mode t)                 ; enable highlight configuration
(require 'hl-line)
(set-face-background 'hl-line "#2f4f4f")
(set-face-attribute 'region nil :background "#707899" :foreground "#c1cdc1")
(set-face-attribute hl-line-face nil :underline nil)
(set-face-background 'highlight nil)
(set-cursor-color "#FEFF00")

(global-linum-mode t)                   ; enable line numbers

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
;;; PACKAGES
;;;

;; Loaded on Emacs start ...
(use-package ag :ensure t)
(use-package avy :ensure t :commands (avy-goto-word-1))
(use-package company :ensure t)
(use-package counsel-projectile :ensure t)
(use-package exec-path-from-shell :ensure t)
(use-package flycheck :ensure t :init (global-flycheck-mode))
(use-package general :ensure t)
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

;;;
;;; CONFIGURATIONS
;;;

;; config: Add a directory to the load path so we can put extra files there
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; config: custom functions
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
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-copy-env "GOPATH"))

(setq exec-path-from-shell-variables '("PATH"
                                       "MANPATH"

                                       ;; *env
                                       "RBENV_ROOT"
                                       "PYENV_ROOT"

                                       ;; Go path variables.
                                       "GOPATH"
                                       "GOROOT"
                                       ))


;; config: general
(general-define-key
 "C-?"     'undo
 "C-a"     'mwim-beginning-of-code-or-line-or-comment
 "C-e"     'mwim-end-of-code-or-line
 "C-s"     'counsel-grep-or-swiper
 "M-x"     'counsel-M-x
 )

(general-define-key
 :prefix "C-x"
 "C-f"     'counsel-find-file
 )

(general-define-key
 :prefix "C-c"
 ;; bind to simple key press
 "/"   'counsel-projectile-ag            ; find string in git project through ag

 ;; bind to double key press
 "C-'" 'avy-goto-word-1                  ; search by first character in word
 "C-d" 'duplicate-line                   ; duplicate current line
 "fr"  'counsel-recentf                  ; find recently edited files
 "pf"  '(counsel-git :which-key "find file in git dir")
 "pp"  'counsel-projectile-switch-project
 )

;; config: go-mode
;; Define function to call when go-mode loads
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers

  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
  (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
  (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

  ;; Key bindings for go testing
  (local-set-key (kbd "M-t f") 'go-test-current-file)
  (local-set-key (kbd "M-t t") 'go-test-current-test)
  (local-set-key (kbd "M-t p") 'go-test-current-project)
  (local-set-key (kbd "M-t b") 'go-test-current-benchmark)
  (local-set-key (kbd "M-t x") 'go-run)

  ;; Misc go stuff
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode 1)
  )

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Ensure the go specific autocomplete is active in go-mode.
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; If the go-guru.el file is in the load path, this will load it.
;;(require 'go-guru)

;; config: ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
  ;; number of result lines to display
  (setq ivy-height 20)
  ;; does not count candidates
  (setq ivy-count-format "")
  ;; no regexp by default
  (setq ivy-initial-inputs-alist nil)
  ;; configure regexp engine.
  (setq ivy-re-builders-alist
	;; allow input not in order
        '((t   . ivy--regex-ignore-order)))

;; config: company
(add-hook 'after-init-hook 'global-company-mode)

;; config: which-key
(which-key-mode t)
(setq which-key-popup-type 'minibuffer)


;;; --------------------------------------------------------------------------------
;;;
;;; CUSTOM SET VARIABLES
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (which-key mwim company-go nlinum gotest ag go-guru neotree solarized-theme atom-one-dark go-mode company counsel-projectile avy general use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
