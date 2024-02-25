(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package emacs :ensure nil :config (setq ring-bell-function #'ignore))

;;evil mode(vim emulation)
(use-package evil :ensure t :demand t
    :init     ;; tweak evil's configuration before loading
    (setq evil-want-integration t)
    (setq evil-want-keybinding nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (evil-mode 1))
    (use-package evil-collection :ensure t
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))
(use-package evil-tutor :ensure t)

;; Code Completion
(use-package company
  :after prog-mode
  :ensure t)

;; Parentheses completion
(use-package smartparens-mode
  :ensure smartparens
  :hook (prog-mode text-mode markdown-mode)
  :config
  (require 'smarparens-config))

;; LSP
(use-package lsp-mode
  :ensure t
  :hook (c++-mode))

;; Which-key
(use-package which-key :ensure t
  :init
  (which-key-mode))

