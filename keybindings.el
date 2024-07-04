;; General
(use-package general :ensure t
  :config
  (general-evil-setup)

  (general-create-definer leader-keys
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC" ;; Set leader
  :global-prefix "M-SPC")

  (leader-keys
    "b" '(:ignore t :wk "Buffer")
    ;;"b b" '(switch-to-buffer :wk "Switch buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previuos buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b i" '(ibuffer :wk "Ibuffer"))

  (leader-keys
    "e" '(:ignore t :wk "Eval")
    "e b" '(eval-buffer :wk "Evaluate buffer")
    "e r" '(eval-region :wk "Evaluate region"))

  (leader-keys
    "." '(find-file :wk "Find file")
    "," '(consult-buffer :wk "Switch buffer")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs")) :wk "Open emacs config")
    "TAB TAB" '(comment-line :wk "Comment lines"))

  (leader-keys
    "h" '(:ignore t :wk "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable")
    "h r r" '(reload :wk "Reload emacs config"))

  (leader-keys
    "w" '(:ignore t :wk "Window")
    "w o" '(ace-window :wk "Ace window")
    "w j" '(windmove-left :wk "Move to right window")
    "w k" '(windmove-down :wk "Move to down window")
    "w l" '(windmove-up :wk "Move to up window")
    "w ;" '(widmoce-right :wk "Move to right window"))

  (leader-keys
    "f u" '(sudo-edit-find-file :wk "Sudo find file")
    "f U" '(sudo-edit :wk "Sudo edit file"))
  
  )


;; Defer keybinding setup until Evil mode is loaded
(with-eval-after-load 'evil
;; ;;   ;; Remap hjkl to jkl;
;;    (define-key evil-normal-state-map "h" nil)
;;    (define-key evil-normal-state-map "j" 'evil-backward-char)
;;    (define-key evil-normal-state-map "k" 'evil-next-line)
;;    (define-key evil-normal-state-map "l" 'evil-previous-line)
;;    (define-key evil-normal-state-map ";" 'evil-forward-char)

;;    (define-key evil-visual-state-map "h" nil)
;;    (define-key evil-visual-state-map "j" 'evil-backward-char)
;;    (define-key evil-visual-state-map "k" 'evil-next-line)
;;    (define-key evil-visual-state-map "l" 'evil-previous-line)
;;    (define-key evil-visual-state-map ";" 'evil-forward-char)
)

;; Reload function
(defun reload ()
  (interactive)
  (load-file "~/.config/emacs/init.el")
  (load-file "~/.config/emacs/init.el")
  )


;; Define key bindings for Vertico using general
(general-define-key
 :keymaps 'vertico-map
 "C-j" 'vertico-next
 "C-k" 'vertico-previous)


(general-define-key
 ;; Window movement
 "C-c ;" 'windmove-right
 "C-c j" 'windmove-left
 "C-c l" 'windmove-up
 "C-c k" 'windmove-down

 ;; ace-window
 "M-o" 'ace-window)


