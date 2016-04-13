(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

(load "~/.emacs.d/email")
(load "~/.emacs.d/themes")

(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")
