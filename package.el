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
  :defer 2
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))

(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))

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
  (which-key-mode 1)
  :config
  (setq  which-key-add-column-padding 1
	 which-key-min-display-lines 6
	 which-key-idle-delay 0.8
	 which-key-separator " → " ))

;; Theme
(use-package doom-themes :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-acario-dark t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colours") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;(use-package smart-tabs-mode :ensure t
;;  :init
;;  (global-smart-tab-mode 1)
;;  (setq indent-tabs-mode 1))

;; Vertico
(use-package vertico :ensure t
  :init
  (vertico-mode 1))

;; Ace-window
(use-package ace-window :ensure t)

;; Sudo-edit
(use-package sudo-edit :ensure t)
