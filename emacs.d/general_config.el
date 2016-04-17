;;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; automatically follow symlinks
(setq vc-follow-symlinks t)

;; Check any TLS connections against my local trust roots
(setq tls-checktrust t)
(setq gnutls-verify-error t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; prevent error on startup in dired
(setq dired-use-ls-dired nil)

;; setup auto-complete
(ac-config-default)

;; setup exec-path-from-shell with some ENV variables
(setq exec-path-from-shell-check-startup-files nil)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "GPG_AGENT_INFO"))

;; setup Scala
(add-hook 'scala-mode-hook 'ensime-mode)

;; setup JDEE
(require 'jdee)

;; setup drag-stuff (move line/region with M-up or M-down)
(drag-stuff-global-mode 1)
