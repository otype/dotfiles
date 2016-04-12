(add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu/mu4e")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(load-theme 'base16-solarized t)

(setq mu4e-mu-binary (executable-find "/usr/local/bin/mu"))
(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.mails/hansotypede"))
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")
(setq mu4e-refile-folder "/[Gmail].All Mail")

;; where to find the signature
(setq message-signature-file "~/.emacs.d/.signature") ; put your signature in this file

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "/usr/local/bin/mbsync -a")

;; shortcuts
(setq mu4e-maildir-shortcuts
    '( ("/INBOX"               . ?i)
       ("/[Gmail].Sent Mail"   . ?s)
       ("/[Gmail].Trash"       . ?t)
       ("/[Gmail].All Mail"    . ?a)))

;; something about ourselves
(setq
   user-mail-address "hans@otype.de"
   user-full-name  "Hans-Gunther Schmidt"
   mu4e-compose-signature
    (concat
      "Cheers,\n"
      "Hans\n"))

;; show images
(setq mu4e-show-images t)
(setq mu4e-view-show-images t)

;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)

;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads")

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; convert html emails properly
;; Possible options:
;;   - html2text -utf8 -width 72
;;   - textutil -stdin -format html -convert txt -stdout
;;   - html2markdown | grep -v '&nbsp_place_holder;' (Requires html2text pypi)
;;   - w3m -dump -cols 80 -T text/html
;;   - view in browser (provided below)
;;(setq mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")
(setq mu4e-html2text-command "/usr/local/bin/w3m -T text/html")

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

;; add option to view html message in a browser
;; `aV` in view to activate
(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)

; use msmtp
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/local/bin/msmtp")

; tell msmtp to choose the SMTP server according to the from field in the outgoing email
(setq message-sendmail-extra-arguments '("--read-envelope-from"))
(setq message-sendmail-f-is-evil 't)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("0268338ad854c131bafdecb4dbc8d3d60332e69a46e7639fd7929b4b5ef31ed2" "cb9f879ffc4006bab31dba5a437194a0b1b922663ea31ee046a5950c0d6ca459" "6e374d611dbf22f2edfc1310277860e0607e22e6ab428c1fbc9a97413b794c19" "07dda9a3249f9ac909e7e0dc3c8876fd45898aa21646e093148dbd6ebb294f66" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
