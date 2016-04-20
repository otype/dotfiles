(setq mu4e-mu-binary (executable-find "/usr/local/bin/mu"))
(require 'mu4e)
(require 'mu4e-contrib)
(require 'org-mu4e)
(require 'mu4e-maildirs-extension)
(require 'mu4e-contrib)

;; use 'eww' renderer for HTML mails
(defun my-render-html-message ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))

(setq mu4e-html2text-command 'my-render-html-message)

;; enable maildirs extension
(mu4e-maildirs-extension)

;; Don't send to these address in wide reply.
(setq message-dont-reply-to-names '("notifications@github\\.com"
                                    ".*@noreply\\.github\\.com"
                                    "hans@otype\\.de"))

;; This is ME!
(setq user-mail-address "hans@otype.de")
(setq user-full-name "Hans-Gunther Schmidt")

;; decrypt automatically
(setq mu4e-decryption-policy t)

;; be prompted with key selection menu before sending a message
;(setq mm-sign-option 'guided)

;; automatically sign outgoing mails
(add-hook 'message-send-hook 'mml-secure-message-sign-pgpmime)

;; Automaticall load epa-mail-mode in mu
;; EasyPG ships with a minor mode for use in mail programs, which is really useful. Enables epa-mail-mode when composing messages.
;; Now, when composing a message, use:
;;   C-c C-e s to sign a message.
;;   C-c C-e e to encrypt a message
(add-hook 'mu4e-compose-mode-hook
   (defun my-setup-epa-hook ()
     (epa-mail-mode)))

;; Now, when viewing a message, enter:
;;   C-c C-e v to verify a signature
;;   C-c C-e d to decrypt a message
(add-hook 'mu4e-view-mode-hook
  (defun my-view-mode-hook ()
    (epa-mail-mode)))

;; set visisble header lines
(setq mu4e-headers-visible-lines 30)

;;; Mu4e settings
;;
(setq mu4e-headers-skip-duplicates t)

;; Our mail base directory
(setq mu4e-maildir (expand-file-name "~/.mails"))

;; when to refresh mails
(setq mu4e-update-interval 600)

;;; Save attachment (this can also be a function)
(setq mu4e-attachment-dir "~/Downloads")

;;; Use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)

;; Silly mu4e only shows names in From: by default. Of course we also want the addresses.
(setq mu4e-view-show-addresses t)

;; Show Smileys
(add-hook 'mu4e-view-mode-hook 'smiley-buffer)

;; Attempt to show images when viewing messages
(setq mu4e-show-images t
      mu4e-view-image-max-width 800)
(setq mu4e-view-show-images t
      mu4e-view-image-max-width 800)

;; use imagemagick to show images
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;;; View html message in firefox (type aV)
;(add-to-list 'mu4e-view-actions
;	     '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; sendmail configuration
(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/local/bin/msmtp"
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-sendmail-f-is-evil 't)

;; get mail configuration
(setq mu4e-get-mail-command "/usr/local/bin/mbsync -a")

;;; Don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; use w3m for html
;(setq mu4e-html2text-command "/usr/local/bin/w3m -T text/html")
;(setq mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout")

;; bail out of mu4e with Q
(define-key mu4e-main-mode-map "q" 'quit-window)
(define-key mu4e-main-mode-map "Q" 'mu4e-quit)

;; Shortcuts for jumping around mailboxes
;;
(setq mu4e-maildir-shortcuts
      '(("/hansotypede/inbox"   . ?I)
	("/hansotypede/starred" . ?S)
	("/wirotypede/inbox"    . ?w)
	("/hansschmidtmeltwatercom/inbox"         . ?i)
	("/hansschmidtmeltwatercom/catch_all"     . ?c)
	("/hansschmidtmeltwatercom/all_meltwater" . ?a)
	("/hansschmidtmeltwatercom/starred"       . ?s)))

;; Contexts
;;
(setq mu4e-contexts
      `(, (make-mu4e-context
	   :name "Private"
	   :enter-func (lambda () (mu4e-message "Switch to the Private context"))
	   ;; leave-func not defined
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       :to "hans@otype.de")))
	   :vars '(
		   (user-mail-address      . "hans@otype.de")
		   (user-full-name         . "Hans-Gunther Schmidt")
		   (message-signature-file . "~/.signature-hansotypede")
		   (mu4e-sent-folder       . "/hansotypede/sent")
		   (mu4e-drafts-folder     . "/hansotypede/drafts")
		   (mu4e-trash-folder      . "/hansotypede/trash")
		   (mu4e-refile-folder     . "/hansotypede/archive")
		   ))
	  ,(make-mu4e-context
	   :name "Family"
	   :enter-func (lambda () (mu4e-message "Switch to the Family context"))
	   ;; leave-func not defined
	   :match-func (lambda (msg)
			 (when msg
			   (mu4e-message-contact-field-matches msg
							       :to "wir@otype.de")))
	   :vars '(
		   (user-mail-address      . "wir@otype.de")
		   (user-full-name         . "Naz & Hans-Gunther Schmidt")
		   (message-signature-file . "~/.signature-wirotypede")
		   (mu4e-sent-folder       . "/wirotypede/sent")
		   (mu4e-drafts-folder     . "/wirotypede/drafts")
		   (mu4e-trash-folder      . "/wirotypede/trash")
		   (mu4e-refile-folder     . "/wirotypede/archive")
		   ))
	  ,(make-mu4e-context
	    :name "Work"
	    :enter-func (lambda () (mu4e-message "Switch to the Work context"))
	    ;; leave-fun not defined
	    :match-func (lambda (msg)
			  (when msg
			    (mu4e-message-contact-field-matches msg
								:to "hans.schmidt@meltwater.com")))
	    :vars '(
		    (user-mail-address       . "hans.schmidt@meltwater.com")
		    (user-full-name          . "Hans-Gunther Schmidt")
		    (message-signature-file  . "~/.signature-hansschmidtmeltwatercom")
		    (mu4e-sent-folder        . "/hansschmidtmeltwatercom/sent")
		    (mu4e-drafts-folder      . "/hansschmidtmeltwatercom/drafts")
		    (mu4e-trash-folder       . "/hansschmidtmeltwatercom/trash")
		    (mu4e-refile-folder      . "/hansschmidtmeltwatercom/archive")
		    ))))
