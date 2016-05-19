;; activate HELM
(require 'helm-config)
(helm-mode 1)

;; Markdown
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
;(ac-config-default)

;; enable company-mode
(add-hook 'after-init-hook 'global-company-mode)

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

;; enable projectile globally
(projectile-global-mode)

;; use neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; let neotree work with projectile
(setq projectile-switch-project-action 'neotree-projectile-action)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (message "Could not find git project root."))))

(add-hook 'ruby-mode-hook 'projectile-mode)
(add-hook 'elixir-mode-hook 'projectile-mode)
(add-hook 'scala-mode-hook 'projectile-mode)

;; for the lazy people who don't want to type 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)
