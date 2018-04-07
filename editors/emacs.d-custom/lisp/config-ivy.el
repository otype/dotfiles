;;; package --- Ivy configuration
;;; Commentary:
;;; This includes all Ivy configurations.

;;; Code:

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

(provide 'config-ivy)
;;; config-ivy.el ends here
