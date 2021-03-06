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
(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure t)
(use-package bind-key :ensure t)

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
  :bind
  ("C-x g" . magit-status)
  )

;;
;; setup ivy mode
;;
(use-package ivy
  :ensure t
  :bind
  (("\C-s" . swiper)
  ("C-c C-r" . ivy-resume)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (use-package swiper :ensure t)
  (use-package counsel :ensure t))


;;
;; setup yasnippets
;;

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode)
  (add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'web-mode)))
  :config
  (use-package yasnippet-snippets :ensure t)
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
;; use projectile
;;
(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy)
  (setq projectile-enable-caching t)
  (projectile-register-project-type 'npm '("package.json")
                  :compile "npm install"
                  :test "npm test"
                  :run "npm start"
                  :test-suffix ".spec")
  )


;;
;; for web developement
;; 
(load "~/.emacs.d/customize/web.el")


(provide 'init)
;;; init.el end here

