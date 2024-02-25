;;(map! :nvi "M-j" #'evil-window-left)
;;(map! :nvi "M-k" #'evil-window-down)
;;(map! :nvi "M-l" #'evil-window-up)
;;(map! :nvi "M-;" #'evil-window-right)

; shift hjkl to jkl;
;;(map! :nv "j" #'evil-backward-char)
;;(map! :nv "k" #'evil-next-line)
;;(map! :nv "l" #'evil-previous-line)
;;(map! :nv ";" #'evil-forward-char)
;;(map! :nv "h" #'evil-snipe-repeat)

;; Remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;(define-key evil-normal-state-map "j" 'evil-backward-char)
;;(define-key evil-normal-state-map "k" 'evil-next-line)
;;(define-key evil-normal-state-map "l" 'evil-previous-line)
;;(define-key evil-normal-state-map ";" 'evil-forward-char)

;; Comments and Keywords
(set-face-attribute 'font-lock-comment-face nil
		    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
		    :slant 'italic)

;; Display line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
