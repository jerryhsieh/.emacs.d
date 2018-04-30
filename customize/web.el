;;; package --- Summary
;;; all package related to web developemtn
;;;

;;
;; web mode
;;

(use-package web-mode
  :ensure t
  :mode
  (("\\.html?\\'" . web-mode)
   ("\\.vue\\'" . web-mode))
  :commands web-mode
  :config 
  (setq web-mode-auto-close-style 1)
  (setq web-mode-auto-quote-style 1)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-expanding t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-enable-css-colorization t)
  )

;;
;; emmet mode
;;

(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'css-mode-hook  'emmet-mode)
  (add-hook 'web-mode-hook  'emmet-mode)
  (add-hook 'js2-mode-hook  'emmet-mode)
  (add-hook 'html-mode-hook  'emmet-mode)
  (add-hook 'sgml-mode-hook  'emmet-mode)  
  )

;;
;; use js2 mode
;;
(use-package js2-mode
  :ensure t
  :mode
  (("\\.js\\'" . js2-mode)
   ("\\.json\\'" . javascript-mode))
  )

(use-package js2-refactor
  :ensure t
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  )

;;
;; rainbow mode
;;
(use-package rainbow-mode
  :ensure t
  :init
  (add-hook 'css-mode-hook #'rainbow-mode)
  (add-hook 'scss-mode-hook #'rainbow-mode)
  (add-hook 'web-mode-hook #'rainbow-mode)    
  )


(provide 'web)
;;; webmode end here
