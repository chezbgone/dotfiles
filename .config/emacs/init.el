(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(use-package evil
  :config
  (evil-mode 1)
  (define-key evil-motion-state-map (kbd "H") 'evil-first-non-blank)
  (define-key evil-motion-state-map (kbd "L") 'evil-end-of-line)
  :hook
  (evil-insert-state-entry . (lambda ()
                               (setq display-line-numbers t)))
  (evil-insert-state-exit . (lambda ()
                              (setq display-line-numbers 'relative))))

(use-package which-key
  :config
  (which-key-mode))

(use-package counsel
  :after ivy
  :diminish
  :config (counsel-mode))

(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers 1)
  :config (ivy-mode))

(use-package ivy-rich
  :after ivy
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer)
  (ivy-rich-mode 1))

(use-package prescient
  :after ivy)

(use-package ivy-prescient
  :after prescient
  :config (ivy-prescient-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-S-s" . swiper)))


(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

(use-package undo-tree
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package evil-snipe
  :after evil
  :init
  (setq evil-snipe-auto-disable-substitute -1)
  :config
  (setq evil-snipe-scope `whole-visible)
  (setq evil-snipe-repeat-scope `whole-visible)
  (evil-snipe-override-mode 1))


(use-package org
  :config
  (setq org-agenda-files '("~/org"))
  (setq org-agenda-todo-list-sublevels nil))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (setq org-startup-indented t)
  (setq org-log-done 'time))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :config
  (defface my-org-bullets
    '((t :family "Symbola"
        ))
    "Face for org-bullets bullets.")
  (setq org-bullets-face-name (quote my-org-bullets)))



(use-package tree-sitter
  :diminish
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs)

(use-package company
  :diminish
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (company-mode 1))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (python-mode . lsp)
  :commands lsp)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package company-quickhelp
  :bind
  (:map company-active-map
        ("M-h" . company-quickhelp-manual-begin)))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))
(use-package lsp-pyright
  :after lsp-mode)


; ocaml stuff
(use-package tuareg
  :mode ("\\.ml[ily]?$" . tuareg-mode))
(use-package merlin
  :custom
  (merlin-completion-with-doc t)
  :bind (:map merlin-mode-map
              ("M-." . merlin-locate)
              ("M-," . merlin-pop-stack)
              ("M-?" . merlin-occurrences)
              ("C-c C-j" . merlin-jump)
              ("C-c i" . merlin-locate-ident)
              ("C-c C-e" . merlin-iedit-occurrences)
              )
  :hook
  ;; Start merlin on ml files
  ((reason-mode tuareg-mode caml-mode) . merlin-mode)
  )
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
   ;; Register Merlin
   (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
   (autoload 'merlin-mode "merlin" nil t nil)
   ;; Automatically start it in OCaml buffers
   (add-hook 'tuareg-mode-hook 'merlin-mode t)
   (add-hook 'caml-mode-hook 'merlin-mode t)
   ;; Use opam switch to lookup ocamlmerlin binary
   (setq merlin-command 'opam)))




(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(electric-pair-mode 1)
(setq electric-pair-open-newline-between-pairs 1)
; (load-theme 'atom-one-dark t)
(load-theme 'darcula t)

;(global-display-line-numbers-mode)
;(add-hook 'doc-view-mode-hook 'display-line-numbers-mode 0)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'latex-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type "relative")


(setq x-select-enable-clipboard-manager nil)

(setq-default show-trailing-whitespace t)
(dolist (hook `(special-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                minibuffer-setup-hook))
 (add-hook hook
   (lambda () (setq-local show-trailing-whitespace nil))))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq delete-old-versions t)
(setq version-control t)
(setq vc-make-backup-files t)
(setq backup-directory-alist `(("." . "~/.config/emacs/backups")))
(setq vc-follow-symlinks t)
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/auto-save-list/" t)))
(setq ring-bell-function 'ignore)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)
(setq default-fill-column 80)
(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(setq-default display-fill-column-indicator-column 80)

(setq font-latex-fontify-sectioning 1.0)
(setq TeX-parse-self t)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

(fset 'yes-or-no-p 'y-or-n-p)
(setq coq-prog-name "/home/jason/.opam/4.13.1/bin/coqtop")

(setq custom-file (concat user-emacs-directory "/custom.el"))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(add-hook 'eshell-mode-hook (lambda () (local-set-key (kbd "C-l") (eshell/clear 1))))

(set-face-foreground 'font-lock-comment-face "#888888")

;; Normal bindings for xref (scheme tags stuff)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
(define-key evil-normal-state-map (kbd "M-,") 'xref-pop-marker-stack)
