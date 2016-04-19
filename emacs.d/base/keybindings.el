;;; GENERAL KEYBINDINGS

;; Use C-c C-d for duplicating line
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

;; Two alternatives for M-x combo ...
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; use C-w for killing last word ... moves former kill to C-x C-k
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; alias 'sh' for multi-term
(defalias 'sh 'multi-term)

;; Use C-c s to start shell
(global-set-key "\C-cs" 'sh)

;; bind HELM to M-x
(global-set-key (kbd "M-x") 'helm-M-x)

;; open neotree
(global-set-key (kbd "C-c C-p") 'neotree-project-dir)

;; kill buffer directly with C-x k ... no confirmation unless modified
(global-set-key (kbd "C-x k") 'kill-this-buffer)
