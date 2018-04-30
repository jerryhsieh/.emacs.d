;;
;; use package (for emacs > 24)
;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;;
;; some basic customization
;;

;; disable menu-bar
(menu-bar-mode -1)

;; match paren
(show-paren-mode t)

;; electric mode
(electric-pair-mode t)

;;
;; set up magit
;;
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)


