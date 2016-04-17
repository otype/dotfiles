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
