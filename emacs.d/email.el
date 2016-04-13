(add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary (executable-find "/usr/local/bin/mu"))
(require 'mu4e)
(require 'mu4e-maildirs-extension)
(mu4e-maildirs-extension)

;(add-hook 'mu4e-update-pre-hook 'etc/imapfilter)
;(defun etc/imapfilter ()
;  (message "Running imapfilter...")
;  (with-current-buffer (get-buffer-create " *imapfilter*")
;    (goto-char (point-max))
;    (insert "---\n")
;    (call-process "/usr/local/bin/imapfilter" nil (current-buffer) nil "-v"))
;  (message "Running imapfilter...done"))

(setq mu4e-maildir (expand-file-name "~/.mails")
      mu4e-html2text-command "/usr/local/bin/w3m -T text/html"
      user-full-name "Hans-Gunther Schmidt"
      mu4e-show-images t
      mu4e-view-show-images t
      mu4e-sent-messages-behavior 'delete
      mu4e-get-mail-command "/usr/local/bin/mbsync -a"
      mu4e-update-interval 600
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/local/bin/msmtp"
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-sendmail-f-is-evil 't
      mu4e-use-fancy-chars t
      mu4e-attachment-dir "~/Downloads")

(setq user-mail-address "hans@otype.de"
      message-signature-file "~/.signature-hansotypede"
      mu4e-sent-folder "/hansotypede/sent"
      mu4e-drafts-folder "/hansotypede/drafts"
      mu4e-trash-folder "/hansotypede/trash"
      mu4e-refile-folder "/hansotypede/archive"
      mu4e-maildir-shortcuts
      '(
	("/hansotypede/inbox"   . ?i)
	("/hansotypede/sent"    . ?s)
	("/hansotypede/trash"   . ?t)
	("/hansotypede/drafts"  . ?d)
	("/hansotypede/archive" . ?a)
	("/hansschmidtmeltwatercom/inbox"   . ?I)
	("/hansschmidtmeltwatercom/sent"    . ?S)
	("/hansschmidtmeltwatercom/trash"   . ?T)
	("/hansschmidtmeltwatercom/drafts"  . ?D)
	("/hansschmidtmeltwatercom/archive" . ?A)))

(defvar my-mu4e-account-alist
  '(("hansotypede"
     (user-mail-address "hans@otype.de")
     (message-signature-file "~/.signature-hansotypede")
     (mu4e-sent-folder "/hansotypede/sent")
     (mu4e-drafts-folder "/hansotypede/drafts")
     (mu4e-trash-folder "/hansotypede/trash")
     (mu4e-refile-folder "/hansotypede/archive"))
    ("hansschmidtmeltwatercom"
     (user-mail-address "hans.schmidt@meltwater.com")
     (message-signature-file "~/.signature-hansschmidtmeltwatercom")
     (mu4e-sent-folder "/hansschmidtmeltwatercom/sent")
     (mu4e-drafts-folder "/hansschmidtmeltwatercom/drafts")
     (mu4e-trash-folder "/hansschmidtmeltwatercom/trash")
     (mu4e-refile-folder "/hansschmidtmeltwatercom/archive"))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

;; spell check
(add-hook 'mu4e-compose-mode-hook
	  (defun my-do-compose-stuff ()
	    "My settings for message composition."
	    (set-fill-column 72)
	    (flyspell-mode)))

(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
