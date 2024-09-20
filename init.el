;;;init

(load "~/.config/emacs/package.el")
(load "~/.config/emacs/config.el")
(load "~/.config/emacs/keybindings.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-box-icons-alist 'company-box-icons-all-the-icons)
 '(package-selected-packages
   '(tree-sitter treesit company-dabbrev magit dashboard org-roam-ui org-roam evil-org org-bullets python-black dap-python dap-gdb-lldb py-autopep8 py-yapf yapfify flycheck-pyflakes lsp-python-ms flymake-python-pyflakes company-c-headers company-elisp vertico-directory flycheck-inline flycheck-posframe lsp-java lsp-ui company-irony flycheck vertico evil-collection evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

