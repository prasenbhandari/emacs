
;; Remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Comments and Keywords
(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

;; Display line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; Font
(set-face-attribute 'default nil
		    :font "JetBrains mono"
		    :height 120
		    :weight 'medium)

;; Start screen
;;(setq inhibit-startup-screen t)


(electric-pair-mode 1)
(electric-indent-mode 1)


;; ORG config
;; (setq org-startup-indented t)
;; (setq org-adapt-indentation t)
;; (add-hook 'org-mode-hook 'org-indent-mode)

;; indent styles
(setq c-default-style
      '((c++-mode . "java") (c-mode . "java") (java-mode . "java") (other . "gnu")))


;; (setq gc-cons-threshold most-positive-fixnum)
;; (add-hook 'emacs-startup-hook
;;           (lambda () (setq gc-cons-threshold 16777216)))


(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))


(provide 'config)

;;; config.el ends here
