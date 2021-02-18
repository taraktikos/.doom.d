;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Taras S."
      user-mail-address "tarassuhovenko@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! smartparens
  :init (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  :hook ((lisp-mode . smartparens-strict-mode)
         (clojure-mode . smartparens-strict-mode)
         (emacs-lisp-mode . smartparens-strict-mode)))

(use-package! aggressive-indent
  :hook ((lisp-mode . aggressive-indent-mode)
         (clojure-mode . aggressive-indent-mode)
         (emacs-lisp-mode . aggressive-indent-mode)))

(after! clojure-mode
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t))

(after! smartparens
  (define-key smartparens-mode-map (kbd "M-j") #'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "M-k") #'sp-backward-sexp)
  (define-key global-map (kbd "M-l") #'sp-down-sexp) ; by default in global map M-l -> to lowercase
  (define-key smartparens-mode-map (kbd "M-;") #'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "M-h") #'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "M-n") #'sp-backward-down-sexp)

  (when IS-MAC
    (define-key smartparens-mode-map (kbd "s-K") #'sp-forward-slurp-sexp)
    (define-key smartparens-mode-map (kbd "s-J") #'sp-forward-barf-sexp))

  (unless IS-MAC
    (define-key smartparens-mode-map (kbd "C-K") #'sp-forward-slurp-sexp)))

(toggle-frame-fullscreen)
