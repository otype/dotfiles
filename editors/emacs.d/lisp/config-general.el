;;; package --- General Plugin configuration
;;; Commentary:
;;; This includes all configurations for the 'general' plugin

;;; Code:
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
 "C-n" 'neotree-toggle
 "fr"  'counsel-recentf                  ; find recently edited files
 "pf"  '(counsel-git :which-key "find file in git dir")
 "pp"  'counsel-projectile-switch-project
 )

(provide 'config-general)
;;; config-general.el ends here
