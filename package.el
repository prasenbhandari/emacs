;;; All the packages and their cofiguration

;;; code
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
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
  (setq company-backends '(company-capf
			   company-keywords
			   company-files
			   company-dabbrev
			   company-yasnippet))
  (add-to-list 'company-backends 'company-files)
  (add-to-list 'company-backends 'company-yasnippet)
  (add-hook 'org-mode-hook 'company-mode)

  :bind (:map company-active-map
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

(use-package company-org-block
  :ensure t
  :after company
  :config
  (add-to-list 'company-backends 'company-org-block))


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


(use-package lsp-java
  :hook (java-mode . lsp-deferred)
  :config (add-hook 'java-mode-hook 'lsp))


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


;; Which-key
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

(use-package consult :ensure t)


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
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-major-mode-color-icon t
	doom-modeline-buffer-state-icon t
	doom-modeline-time t
	doom-modeline-time-live-icon t
	doom-modeline-battery t
	))

(display-battery-mode 1)
(display-time-mode 1)


;; All the icons
(use-package all-the-icons :ensure t)


;; Org mode setup
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq before-make-frame-hook
      (lambda () (let* ((variable-tuple
          (cond ((x-list-fonts "JetBrains Mono")         '(:font "JetBrains Mono"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25 ,:foreground "#ccc564"))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5  ,:foreground "#38848a"))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75 ,:foreground "#388a4e"))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.0 :underline nil))))))

))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package ts
  :ensure t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org-roam/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(use-package websocket
    :after org-roam)

(use-package org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.config/emacs/rayquaza.png"))


;; Startup analyzer
(use-package esup
  :ensure t
  :commands esup)


;; Magit
(use-package magit
  :ensure t)

(provide 'package)
;;; package.el ends here
