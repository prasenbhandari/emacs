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

(set-face-attribute 'default nil
		    :font "JetBrains Mono"
		    :height 100
		    :weight 'medium)

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
;;(load-theme 'doom-acario-dark)

