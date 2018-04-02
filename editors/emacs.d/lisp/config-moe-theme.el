;;; package --- moe-theme configuration
;;; Commentary:
;;; This includes all moe-theme configurations.

;;; Code:

(require 'powerline)
(require 'moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'blue)
(powerline-moe-theme)
(moe-dark)

(provide 'config-moe-theme)
;;; config-moe-theme.el ends here
