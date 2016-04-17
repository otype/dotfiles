(require 'go-mode-autoloads)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/hgschmidt/src/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)
