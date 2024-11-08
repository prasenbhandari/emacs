(deftheme custom-doom-one
  "Created 2024-11-05.")

(custom-theme-set-faces
 'custom-doom-one
 '(default ((t (:inherit nil :extend nil :stipple nil :background "gray6" :foreground "#bbc2cf" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight medium :height 120 :width normal :foundry "JB" :family "JetBrains Mono"))))
 '(cursor ((t (:background "#51afef"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#46D9FF"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "#51afef"))))
 '(highlight ((t (:foreground "#1B2229" :background "#51afef"))))
 '(region ((t (:extend t :background "gray16"))))
 '(shadow ((t (:foreground "#5B6268"))))
 '(secondary-selection ((t (:extend t :background "#3f444a"))))
 '(trailing-whitespace ((t (:background "#ff6c6b"))))
 '(font-lock-bracket-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-builtin-face ((t (:foreground "#c678dd"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#5B6268"))))
 '(font-lock-constant-face ((t (:foreground "#a9a1e1"))))
 '(font-lock-delimiter-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-doc-face ((t (:foreground "#83898d" :inherit (font-lock-comment-face)))))
 '(font-lock-doc-markup-face ((t (:inherit (font-lock-constant-face)))))
 '(font-lock-escape-face ((t (:inherit (font-lock-regexp-grouping-backslash)))))
 '(font-lock-function-call-face ((t (:inherit (font-lock-function-name-face)))))
 '(font-lock-function-name-face ((t (:foreground "#c678dd"))))
 '(font-lock-keyword-face ((t (:foreground "#51afef"))))
 '(font-lock-negation-char-face ((t (:foreground "#51afef" :inherit (bold)))))
 '(font-lock-number-face ((t (:foreground "#da8548"))))
 '(font-lock-misc-punctuation-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-operator-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "#51afef" :inherit (bold)))))
 '(font-lock-property-name-face ((t (:inherit (font-lock-variable-name-face)))))
 '(font-lock-property-use-face ((t (:inherit (font-lock-property-name-face)))))
 '(font-lock-punctuation-face ((t nil)))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#51afef" :inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#51afef" :inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#98be65"))))
 '(font-lock-type-face ((t (:foreground "#ECBE7B"))))
 '(font-lock-variable-name-face ((t (:foreground "#dcaeea"))))
 '(font-lock-variable-use-face ((t (:inherit (font-lock-variable-name-face)))))
 '(font-lock-warning-face ((t (:inherit (warning)))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:weight bold :underline (:color foreground-color :style line :position nil) :foreground "#51afef"))))
 '(link-visited ((default (:inherit (link))) (((class color) (background light)) (:foreground "magenta4")) (((class color) (background dark)) (:foreground "violet"))))
 '(fringe ((t (:foreground "#3f444a" :inherit (default)))))
 '(header-line ((t (:inherit (mode-line)))))
 '(tooltip ((t (:foreground "#bbc2cf" :background "#21242b"))))
 '(mode-line ((t (:box nil :foreground "#bbc2cf" :background "#1d2026"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#51afef"))))
 '(mode-line-highlight ((t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:box nil :foreground "#5B6268" :background "#21242b"))))
 '(isearch ((t (:weight bold :inherit (lazy-highlight)))))
 '(isearch-fail ((t (:weight bold :foreground "#1B2229" :background "#ff6c6b"))))
 '(lazy-highlight ((t (:weight bold :foreground "#DFDFDF" :background "#387aa7"))))
 '(match ((t (:weight bold :foreground "#98be65" :background "#1B2229"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'custom-doom-one)
