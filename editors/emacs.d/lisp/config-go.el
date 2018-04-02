;;; package --- Go configuration
;;; Commentary:
;;; This includes all Go configurations.

;;; Code:

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
   (require 'company-go))

;; If the go-guru.el file is in the load path, this will load it.
(require 'go-guru)

(provide 'config-go)
;;; config-go.el ends here
