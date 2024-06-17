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
		    :font "JetBrains Mono"
		    :height 108
		    :weight 'medium)

; Start screen
(setq inhibit-startup-screen t)

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")
;;(load-theme 'doom-acario-dark)

(electric-pair-mode 1)
(electric-indent-mode 1)

;; ;; Define function to display splash image
;; (defun my/display-splash-image ()
;;   "Display a splash image."
;;   (interactive)
;;   (let ((buffer-name "*Splash Image*"))
;;     (with-current-buffer (get-buffer-create buffer-name)
;;       (erase-buffer)
;;       (let ((image-file "/home/prasen/Pictures/ray1.jpg")) ; Replace with your image file path
;;         (insert-image (create-image image-file))
;;         (display-buffer (current-buffer))
;;         (goto-char (point-min))))))

;; ;; Show splash image on Emacs startup
;; (add-hook 'emacs-startup-hook #'my/display-splash-image)

;; ;; Optional: Adjust image display settings
;; (setq image-animate-loop t)  ; Enable animation for GIFs
;; (setq image-animate-max-size 200)  ; Limit the maximum size for animated images
