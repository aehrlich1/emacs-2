;; -*- lexical-binding: t; -*-
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(defun browse-file-directory ()
  (interactive)
  (browse-url-of-file (expand-file-name default-directory)))
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq custom-file "~/.emacs.d/custom.el")
(setq initial-scratch-message 'nil)
(setq inhibit-startup-echo-area-message "Anatol")
(setq default-process-coding-system '(utf-8 . utf-8))
(setq initial-major-mode 'org-mode)
(setq-default buffer-file-coding-system 'utf-8)
(setq-default default-buffer-file-coding-system 'utf-8)
(setq default-directory "//192.168.178.20/home/syncthing/emacs/")
(set-buffer-file-coding-system 'utf-8)
(set-language-environment "utf-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8 )
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(show-paren-mode +1)
(delete-selection-mode +1)
(blink-cursor-mode 0)
(global-hl-line-mode +1)
(global-auto-revert-mode +1)
(global-visual-line-mode +1)
(global-display-line-numbers-mode)

(global-set-key (kbd "C-M-p") (lambda () (interactive) (scroll-down 2)))
(global-set-key (kbd "C-M-n") (lambda () (interactive) (scroll-up 2)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x ESC") 'save-buffers-kill-terminal)
;(global-set-key (kbd "C-x C-ö") 'browse-file-directory)

(use-package amx
  :ensure t
  :after ivy
  :config
  (setq amx-backend 'auto)
  (setq amx-save-file "~/.emacs.d/amx-items")
  (setq amx-history-length 50)
  (amx-mode 1))

(use-package counsel
  :ensure t
  :diminish
  :config
  (counsel-mode)
  :bind
  ("C-x C-f" . counsel-find-file)
  ("M-y" . counsel-yank-pop)
  ("M-x" . counsel-M-x)
  ("C-c C-r" . ivy-resume)
  ("C-h b" . counsel-descbinds)
  ("C-x d" . counsel-dired) 
  ("C-h a" . counsel-apropos)
  ("C-h C-h" . counsel-org-goto)
  ("C-h f" . counsel-describe-function)
  ("C-h v" . counsel-describe-variable)
  ("C-x b" . ivy-switch-buffer)
  ("C-x r l" . counsel-bookmark)
  ("C-h C-s" . swiper))

(use-package deft
  :ensure t
  :bind 
  ("<f2>" . deft)
  :config 
  (setq deft-extensions '("org" "md"))
  (setq deft-default-extension "org")
  (setq deft-recursive t)
  (setq deft-text-mode 'org-mode)
  (setq deft-directory "//192.168.178.20/home/syncthing/emacs/journal")
  (setq deft-use-filter-string-for-filename t)
  (setq deft-auto-save-interval 0)
  (setq deft-use-filename-as-title 't)
  (setq deft-new-file-format "%Y-%m-%d")
  (setq deft-current-sort-method 'mtime))

(use-package org
  :init
  (define-key lisp-interaction-mode-map (kbd "C-j") nil)
  :config
  (setq org-src-tab-acts-natively t)
  (setq org-cycle-separator-lines 2)
  (setq org-cycle-open-archived-trees t)
  (setq org-catch-invisible-edits 'error)
  (setq org-src-window-setup 'current-window)
  (setq org-todo-repeat-to-state "NEXT")
  (setq org-priorities '("A" "B" "C" "D" "E"))
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?E)
  (setq org-default-priority ?D)
  (setq org-startup-indented t)
  (setq org-indent-indentation-per-level 2)
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "WHIP" "|" "DONE(d)" "KILL(k@)")))
  (setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+")))
  (setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-targets '((org-agenda-files :maxlevel . 10)(ae/org-files-list :maxlevel . 10)))
  (setq org-outline-path-complete-in-steps nil)                                                         
  (setq org-todo-keyword-faces
	'(("TODO" . org-todo)
	  ("NEXT" . "#008080")
	  ("PROG" . "#1e90ff")
	  ("WAIT" . "orange")
	  ("DONE" . org-done)
	  ("WHIP" . "pink")
	  ("KILL" . "#F1420B")))
  :bind
  (("C-c l" . org-store-link)
   (:map org-mode-map)
   ("C-x C-x" . org-edit-special)
   ("C-c e" . org-table-edit-field)
   ("<f9>" . org-clock-in-last)
   ("<f10>" . org-clock-out)
   ("M-l" . org-metaright)
   ("M-j" . org-metaleft)
   ("M-i" . org-metaup)
   ("M-k" . org-metadown)
   ("C-c C-q" . counsel-org-tag)
   ("C-j" . org-journal-new-entry)
   (:map org-src-mode-map)
   ("C-x C-x" . org-edit-src-exit)))

(use-package org-journal
  :ensure t
  :init(blink-cursor-mode 0)
  :bind
  ("C-j" . org-journal-new-entry)
  (:map org-journal-mode-map)
  ("C-c C-s" . nil)
  ("C-c C-s" . org-schedule)
  ("C-c s" . org-journal-search)
  :custom
  (org-journal-file-type 'daily)
  (org-journal-dir "//192.168.178.20/home/syncthing/emacs/journal")
  (org-journal-date-format "%Y-%m-%d %A W:%V")
  (org-journal-file-format "%Y-%m-%d.org")
  :config
  (setq org-journal-hide-entries-p 'nil)
  (setq org-journal-find-file 'find-file))


(use-package zenburn-theme
  :ensure zenburn-theme
  :init
  (load-theme 'zenburn t)
  (set-face-attribute 'default nil :height 130)
  (set-face-attribute 'mode-line nil :box nil)
  :config
  (custom-theme-set-faces
   'zenburn
   `(org-level-7 ((t (:foreground "#Ffe4b5"))))
   `(org-checkbox ((t (:Box unspecified :foreground unspecified :background unspecified :weight bold))))
   `(org-level-1 ((t (:foreground "#DFAF8F" :weight semi-bold :height 1.0))))
   `(org-document-title ((t (:height 1.0))))
   (set-face-attribute 'show-paren-match nil :weight 'normal)
   ))
