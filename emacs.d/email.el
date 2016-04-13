(add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary (executable-find "/usr/local/bin/mu"))
(require 'mu4e)

(setq mu4e-maildir (expand-file-name "~/.mails/hansotypede")
       mu4e-drafts-folder "/[Gmail].Drafts"
       mu4e-sent-folder   "/[Gmail].Sent Mail"
       mu4e-trash-folder  "/[Gmail].Trash"
       mu4e-refile-folder "/[Gmail].All Mail"
       message-signature-file "~/.signature-hansotypede"
       mu4e-sent-messages-behavior 'delete
       mu4e-get-mail-command "/usr/local/bin/mbsync -a"
       mu4e-maildir-shortcuts
       '( ("/INBOX"               . ?i)
 	 ("/[Gmail].Sent Mail"   . ?s)
 	 ("/[Gmail].Trash"       . ?t)
 	 ("/[Gmail].Drafts"      . ?d)
 	 ("/[Gmail].All Mail"    . ?a))
       user-mail-address "hans@otype.de"
       user-full-name  "Hans-Gunther Schmidt"
       ;;mu4e-compose-signature
       ;;(concat
       ;; "Cheers,\n"
       ;; "Hans\n")

       mu4e-show-images t
       mu4e-view-show-images t
       mu4e-use-fancy-chars t
       mu4e-attachment-dir "~/Downloads"
       mu4e-html2text-command "/usr/local/bin/w3m -T text/html"
       mu4e-update-interval 600
       message-send-mail-function 'message-send-mail-with-sendmail
       sendmail-program "/usr/local/bin/msmtp"
       message-sendmail-extra-arguments '("--read-envelope-from")
       message-sendmail-f-is-evil 't)

(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; ;; spell check
;; (add-hook 'mu4e-compose-mode-hook
;;          (defun my-do-compose-stuff ()
;;             "My settings for message composition."
;;             (set-fill-column 72)
;;             (flyspell-mode)))

;;  ;; add option to view html message in a browser
;;  ;; `aV` in view to activate
;;  (add-to-list 'mu4e-view-actions
;;    '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; (setq mu4e-contexts
;;       `( ,(make-mu4e-context
;;  	   :name "Private"
;;  	   :enter-func (lambda () (mu4e-message "Switch to the Private context"))
;;  	   ;; leave-func not defined
;;  	   :match-func (lambda (msg)
;;  			 (when msg 
;;  			   (mu4e-message-contact-field-matches msg 
;;  							       :to "hans@otype.de")))
;;  	   :vars '(  ( user-mail-address . "hans@otype.de"  )
;;  		     ( user-full-name	 . "Hans-Gunther Schmidt" )
;; 		     ( mu4e-maildir (expand-file-name "~/.mails/hansotypede"))
;; 		     ( mu4e-drafts-folder "/[Gmail].Drafts")
;; 		     ( mu4e-sent-folder   "/[Gmail].Sent Mail")
;; 		     ( mu4e-trash-folder  "/[Gmail].Trash")
;; 		     ( mu4e-refile-folder "/[Gmail].All Mail")
;; 		     ;; ( message-signature-file "~/.emacs.d/.signature")
;; 		     ( mu4e-sent-messages-behavior 'delete)
;; 		     ;; ( mu4e-get-mail-command "/usr/local/bin/mbsync -a")
;; 		     ;; ( mu4e-maildir-shortcuts
;; 		     ;;   '( ("/INBOX"               . ?i)
;; 		     ;; 	  ("/[Gmail].Sent Mail"   . ?s)
;; 		     ;; 	  ("/[Gmail].Trash"       . ?t)
;; 		     ;; 	  ("/[Gmail].All Mail"    . ?a))
;;  		     ( mu4e-compose-signature .
;;  					      (concat
;;  					       "Cheers,\n"
;;  					       "Hans-Gunther Schmidt\n"))))
;;  	 ,(make-mu4e-context
;;  	   :name "Work"
;;  	   :enter-func (lambda () (mu4e-message "Switch to the Work context"))
;;  	   ;; leave-fun not defined
;;  	   :match-func (lambda (msg)
;;  			 (when msg 
;;  			   (mu4e-message-contact-field-matches msg 
;;  							       :to "hans.schmidt@meltwater.com")))
;;  	   :vars '(  ( user-mail-address	     . "hans.schmidt@meltwater.com" )
;;  		     ( user-full-name	    . "Hans-Gunther Schmidt" )
;;  		     ( mu4e-compose-signature .
;;  					      (concat
;;  					       "Hans-Gunther Schmidt\n"
;;  					       "Meltwater Berlin\n"))))))

;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
;; guess or ask the correct context, e.g.

;; start with the first (default) context; 
;; default is to ask-if-none (ask when there's no context yet, and none match)
;; (setq mu4e-context-policy 'pick-first)

;; compose with the current context is no context matches;
;; default is to ask 
;; '(setq mu4e-compose-context-policy nil)
