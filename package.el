;;; All the packages and their cofiguration

;;; code
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
;;(package-initialize)


;; Ensure use-package is installed
;; (unless (package-installed-p 'use-package)
;;   (package-refresh-contents)
;;   (package-install 'use-package))


(require 'use-package)
;;(setq use-package-always-ensure t)


;;evil mode(vim emulation)
(use-package evil :ensure t :demand t
    :init     ;; tweak evil's configuration before loading
    (setq evil-want-integration t
	  evil-want-keybinding nil
	  evil-vsplit-window-right t
	  evil-split-window-below t)
    :config
    (evil-mode 1))


(use-package evil-collection :ensure t
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))


;; Code Completion
(use-package company
  :ensure t
  :diminish
  :hook (prog-mode . company-mode)
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
			   company-yasnippet
			   company-files))
  (add-hook 'org-mode-hook 'company-mode)

  :bind (:map company-active-map
              ("<tab>" . company-select-next)
	      ("<backtab>" . company-select-previous)))


(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))


;; LSP
(use-package lsp-mode
  :ensure t
  :hook ((c++-mode c-mode java-mode python-mode) . lsp-deferred)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-prefer-capf t)
  (lsp-keep-workspace-alive nil)
  (read-process-output-max (* 1024 1024))
  (lsp-idle-delay 0.500)) ;; 1mb


(use-package lsp-java
  :ensure t
  :defer t)


(use-package lsp-pyright
  :ensure t
  :defer t
  :hook (python-mode . lsp-deferred))


(use-package python-black
 :ensure t
 :hook (python-mode . python-black-on-save-mode-enable-dwim))


(add-hook 'emacs-lisp-mode-hook 'company-mode)



;; Which-key
(use-package which-key :ensure t
  :config
  (which-key-mode 1)
  (setq  which-key-add-column-padding 1
	 which-key-min-display-lines 6
	 which-key-idle-delay 0.8
	 which-key-separator " → " ))


;; Theme
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-acario-dark t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))


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
  :init
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
(use-package sudo-edit
  :defer t
  :ensure t)


;; Snippets
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)


;; Flycheck
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))

(use-package flycheck-inline
  :ensure t
  :hook (flycheck-mode . flycheck-inline-mode))


;; Modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (setq doom-modeline-major-mode-color-icon t
	doom-modeline-buffer-state-icon t))
  

;; All the icons
(use-package all-the-icons :ensure t)


;; Org mode setup
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(use-package org-bullets
  :defer t
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
  ;;(setq dashboard-startup-banner "~/.config/emacs/rayquaza.png")
  )


;; Startup analyzer
(use-package esup
  :ensure t
  :commands esup)


;; Magit
(use-package magit
  :defer t
  :ensure t)

(provide 'package)
;;; package.el ends here
