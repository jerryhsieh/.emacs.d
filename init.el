;;
;; use package (for emacs > 24)
;;
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-refresh-contents)


;;
;; require use-package
;;
(require 'use-package)


;;
;; some basic customization
;;

;; disable menu-bar
(menu-bar-mode -1)

;; match paren
(show-paren-mode t)

;; electric mode
(electric-pair-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;
;; set customize file
;;
(setq custom-file "~/.emacs.d/customize/.emacs-custom.el")
(load custom-file)

;;
;; set up magit
;;
(use-package magit
  :ensure t
  
  )
(global-set-key (kbd "C-x g") 'magit-status)

;;
;; setup ivy mode
;;
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind
  (:map ivy-mode-map
	("C-'" . ivy-avy))
  ("\C-s" . swiper)
  ("C-c C-r" . ivy-resume)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  :config
  (ivy-mode 1)
  )

;;
;; setup yasnippets
;;

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode)
  (add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'web-mode)))
  )

(use-package yasnippet-snippets
  :ensure t
  )

;;
;; company mode
;;
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)  
  )


;;
;; flycheck mode
;;
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  )

;;
;; for web developement
;; 
(load "~/.emacs.d/customize/web.el")



