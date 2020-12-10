;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "István Donkó"
      user-mail-address "istvan.donko@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 14))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 16))
;; (setq doom-font (font-spec :family "Noto Sans Mono Nerd Font" :size 16))
;; (setq doom-font (font-spec :family "Liberation Mono" :size 16))
;; (setq doom-font (font-spec :family "mononoki Nerd Font Mono" :size 16))
;; (setq doom-font (font-spec :family "RobotoMono Nerd Font Mono" :size 16))
;; (setq doom-font (font-spec :family "FuraMono Nerd Font Mono" :size 16))
;; (setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 16))
(setq doom-font (font-spec :family "DejaVuSansMono Nerd Font Mono" :size 16))

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
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Own stuff

;; (with-eval-after-load 'flycheck
;;   (require 'flycheck-xo)
;;   (flycheck-xo-setup))

(add-hook 'agda2-mode-hook
          (lambda ()
            (setq company-backends '(company-dabbrev-code))
            ;; (add-to-list 'company-backends 'company-dabbrev-code)
            (setq tab-width 2)
            (setq evil-shift-width 2)))

(defun isti115/eslint-fix ()
  "Fix JS files using eslint"
  (interactive)
  (shell-command (concat "eslint --fix '" buffer-file-name "'"))
  (revert-buffer)
  )

(defun isti115/standard-fix ()
  "Fix JS files using the standard code style"
  (interactive)
  ;; (shell-command (concat "standard --fix " buffer-file-name))
  (shell-command (concat "standard --fix '" buffer-file-name "'"))
  (revert-buffer)
  )

;; (setq-default js-indent-level 2)

;; (setq-default js-indent-level 2)
(add-hook 'js2-mode-hook
          (lambda ()
            ;; (setq company-backends '(ac-js2-company))
            ;; (add-to-list 'company-backends 'ac-js2-company)
            ;; (setq company-backends '(company-capf company-tide))
            ;; (add-to-list 'company-backends 'company-tide)
            (setq js2-basic-offset 2)
            (setq tab-width 2)
            (setq evil-shift-width 2)
            ;; (add-hook 'after-save-hook #'standard-fix)
            ;; (add-hook 'after-save-hook 'isti115/standard-fix)
            ))

(set-company-backend! 'js2-mode '(:separate company-capf company-tide))

;; (add-hook 'js2-mode-hook 'eslintd-fix-mode)

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
               ;; (setq js2-basic-offset 2)
               ;; (setq tab-width 2)
               ;; (setq evil-shift-width 2)
               ;; (add-hook 'after-save-hook 'eslintd-fix nil t))))

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "z M-f") 'vimish-fold-avy))

(map! :leader
      :desc "Write and quit (Save and close)" "f w q" #'evil-save-and-close
      ;; :desc "Copy whole file" "y" "myggyG`y") ;; Mark postition, yank and return
      :desc "Copy whole file (Wl)" "y" ":%y"
      ;; :desc "Copy whole file (Wl)" "y" ":w !wl-copy")
      :desc "Copy whole file (X)" "Y" ":w !xclip -sel clip")

(custom-set-faces!
  '(proof-locked-face :background "#003300")
  '(proof-queue-face :background "#001100"))

(add-hook 'coq-mode-hook
          (lambda ()
            (add-to-list 'company-coq-disabled-features 'prettify-symbols)

            ;; (global-company-mode 1)
            ;; (global-auto-complete-mode 1)
            ;; (display-time-mode 1)

            ;; (global-set-key (kbd "C-<") 'proof-undo-last-successful-command)
            ;; (global-set-key (kbd "C->") 'proof-assert-next-command-interactive)
            ;; (global-set-key (kbd "C-?") 'proof-goto-point)
            ;; (global-set-key (kbd "<prior>") 'proof-undo-last-successful-command)
            ;; (global-set-key (kbd "<next>") 'proof-assert-next-command-interactive)
            ;; (global-set-key (kbd "<scroll>") 'proof-goto-point)
            ))

(map! :after agda2-mode
      :map agda2-mode-map
      :localleader
      "gd"  #'agda2-goto-definition-keyboard
      )

;; (add-hook 'agda2-mode-hook
;;           (lambda ()
;;             ))
