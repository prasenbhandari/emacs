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
    "b" '(:ignore t :wk "buffer")
    "b b" '(switch-to-buffer :wk "Switch buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previuos buffer")
    "b r" '(revert-buffer :wk "Reload buffer"))
  )


;; Defer keybinding setup until Evil mode is loaded
(with-eval-after-load 'evil
  ;; Remap hjkl to jkl;
  (define-key evil-normal-state-map "h" nil)
  (define-key evil-normal-state-map "j" 'evil-backward-char)
  (define-key evil-normal-state-map "k" 'evil-next-line)
  (define-key evil-normal-state-map "l" 'evil-previous-line)
  (define-key evil-normal-state-map ";" 'evil-forward-char)

  (define-key evil-visual-state-map "h" nil)
  (define-key evil-visual-state-map "j" 'evil-backward-char)
  (define-key evil-visual-state-map "k" 'evil-next-line)
  (define-key evil-visual-state-map "l" 'evil-previous-line)
  (define-key evil-visual-state-map ";" 'evil-forward-char)
  )
