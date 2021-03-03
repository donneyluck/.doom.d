;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "donney"
      user-mail-address "donney_luck@sina.cn")

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
(setq doom-font (font-spec :family "Courier New" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Courier New" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-tomorrow-night)
(setq doom-theme 'deeper-blue)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


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

(after! org
  (setq org-tags-column -80)
  ;;(set-face-attribute 'org-headline-done nil :strike-through t))
  )

;; (use-package! company-tabnine
;;   :config
;;   (after! lua-mode
;;     (set-company-backend! 'lua-mode 'company-tabnine)))

;; (use-package! company-tabnine
;;   :after company
;;   :when (featurep! :completion company)
;;   :config
;;   (cl-pushnew 'company-tabnine (default-value 'company-backends))
;;     ;; Trigger completion immediately.
;;    (setq company-idle-delay 0)

;;   ;; Number the candidates (use M-1, M-2 etc to select completions).
;;   (setq company-show-numbers t)

  ;; Use the tab-and-go frontend.
  ;; Allows TAB to select and complete at the same time.
  ;;(company-tng-configure-default)
  ;; (setq company-frontends
  ;;       '(company-tng-frontend
  ;;         company-pseudo-tooltip-frontend
  ;;         company-echo-metadata-frontend))
;;)


;; set init frame logo
(setq fancy-splash-image (concat doom-private-dir "logo.png"))

;; change init frame size
;; (pushnew! initial-frame-alist '(width . 280) '(height . 75))
(add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; https://github.com/redguardtoo/emacs.d/blob/8ea127c69cd6e5d6dbbe2c1dce91131c4a4c0cd2/lisp/init-evil.el#L236
;; Press kj to escape from evil-insert-state and everything else in Emacs. It’s much more efficient than ESC in Vim or C-g in Emacs
(setq-default evil-escape-delay 0.3)
(setq evil-escape-excluded-major-modes '(dired-mode))
(setq-default evil-escape-key-sequence "kj")

 ;; (setq mac-option-modifier 'super
 ;;           mac-command-modifier 'mate)

;; (use-package! org-bullets
;;   :hook (org-mode . org-bullets-mode))

;; (use-package! org-fancy-priorities
;;   :ensure t
;;   :hook
;;   (org-mode . org-fancy-priorities-mode)
;;   :config
;;   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

;; (setq deft-directory "~/org"
;;       deft-extensions '("org" "txt")
;;       deft-recursive t)

;; (use-package! color-theme-sanityinc-tomorrow)
(use-package! keyfreq
  :config
  (keyfreq-mode 1)
  )

;; (use-package! google-translate
;;   :config
;;   (require 'google-translate-smooth-ui)
;; (global-set-key "\C-ct" 'google-translate-smooth-translate))
(use-package! youdao-dictionary
  :bind
  (("C-c y" . youdao-dictionary-search-at-point))
  :config
  (setq url-automatic-caching t))

;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq doom-theme 'doom-acario-light)
  (doom/reload-theme))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (req doom-theme 'deeper-blue)
  (doom/reload-theme))
