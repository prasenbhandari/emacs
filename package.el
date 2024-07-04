;;; All the packages and their cofiguration

;;; code
(require 'package)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)


;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

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
    (evil-collection-init)
    (define-key evil-insert-state-map (kbd "TAB") 'indent-for-tab-command)
    (define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
    )

(use-package evil-tutor :ensure t)

;; Code Completion
(use-package company
  :after prog-mode
  :ensure t
  :custom
  (company-backends '(company-capf))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t)
  (global-company-mode)
  :bind (:map company-active-map
              ("TAB" . company-select-next)
              ("<tab>" . company-select-next)
	      ("<backtab>" . company-select-previous)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package company-irony
  :ensure t
  :after (company irony)
  :config
  (add-to-list 'company-backends 'company-irony))


;; LSP

(use-package lsp-mode
  :ensure t
  :hook ((c++-mode . lsp-deferred)
         (c-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (python-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-language-id-configuration
        '((python-mode . "python")
          (c-mode . "c")
          (c++-mode . "cpp")
          (java-mode . "java")))

  :custom
  (lsp-prefer-capf t)
  (lsp-keep-workspace-alive nil))

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)


(use-package lsp-java
  :hook (java-mode . lsp-deferred)
  :config (add-hook 'java-mode-hook 'lsp))

(use-package lsp-clangd
  :ensure nil ;; lsp-clangd is part of lsp-mode
  :after lsp-mode
  :config
  (setq lsp-clients-clangd-args '("--header-insertion=never")))


(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package python-black
  :ensure t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim)
  :config
  (setq python-black-on-save-mode t))

(use-package py-autopep8
  :hook ((python-mode) . py-autopep8-mode))

(add-hook 'emacs-lisp-mode-hook 'company-mode)

;; LSP Performance Tweaks
(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq lsp-idle-delay 0.500)



;; LSP UI
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'bottom
	lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-max-width 100
        lsp-ui-doc-max-height 30))

;; ;; Which-key
(use-package which-key :ensure t
  :config
  (which-key-mode 1)
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
  ;;(doom-themes-neotree-config)
  ;; or for treemacs users
  ;;(setq doom-themes-treemacs-theme "doom-colours") ; use "doom-colors" for less minimal icon theme
  ;;(doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  ;;(doom-themes-org-config)
  )


;; (use-package smart-tabs-mode
;;   :ensure t
;;   :init
;;   (global-smart-tab-mode 1)
;;   (setq indent-tabs-mode 1))


;; Vertico
(use-package vertico
  :ensure t
  :custom
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  :init
  (vertico-mode 1))

(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package savehist
  :init
  (savehist-mode))


;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;;Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :ensure t
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(use-package consult
  :ensure t
  :bind
  ;;("TAB" . )
  )

;; substring search for vertico
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Ace-window
(use-package ace-window :ensure t)


;; Sudo-edit
(use-package sudo-edit :ensure t)


;; Extras
(use-package all-the-icons :ensure t
  :if (display-graphic-p))


;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)


;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-inline
  :ensure t
  :after flycheck
  :hook (flycheck-mode . flycheck-inline-mode))

;; Modeline
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package powerline
  :ensure t)

;; All the icons
(use-package all-the-icons
  :ensure t)


(provide 'package)
;;; package.el ends here
