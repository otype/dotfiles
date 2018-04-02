;;; package --- General Plugin configuration
;;; Commentary:
;;; This includes all configurations for the 'general' plugin

;;; Code:

;; Unset existing keybindings
(general-define-key
 "M-m" nil)

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
;; "pf"  '(counsel-projectile-find-file :which-key "find file dir")
 "pk"  'projectile-kill-buffers
 "p SPC" 'counsel-projectile
 "pp"  'counsel-projectile-switch-project
 )

(general-define-key
 :prefix "M-m"
 "ft"  'neotree-toggle
 "gst" 'magit-status
 )

(provide 'config-general)
;;; config-general.el ends here
