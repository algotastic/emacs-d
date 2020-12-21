;; Hide the tutorial page on startup
(setq inhibit-startup-message t)
(setq initial-buffer-choice "~/.emacs.d/init.el")

;; Disable tool bar, menu bar, scroll bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Highlight the active line
(global-hl-line-mode t)
;; Display line numbers
(global-display-line-numbers-mode t)

;; Use a different file for `custom-*` code
(setq custom-file "~/.emacs.d/custom-file.el")
;; Make sure that the code in custom-file is executed before the theme is loaded
(load-file custom-file)

;; Require and initialize `package`
(require 'package)
(package-initialize)
 
;; Add `melpa` to `package-archives`
;; Use t argument to append rather than prepend
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package spacemacs-common
  :ensure spacemacs-theme
  :init
  ;; Don't use a different background color for comments
  (setq spacemacs-theme-comment-bg nil)
  ;; Comments appear in italics
  (setq spacemacs-theme-comment-italic t)
  :config
  ;; Load the theme
  (load-theme 'spacemacs-dark t))

(use-package company
  :ensure t
  :init
  ;; Make the company dropdown appear immediately
  (setq company-idle-delay 0.0)
  :config
  ;; Enable company-mode everywhere
  (global-company-mode t))

(use-package evil
  :ensure t
  :config
  ;; Enable evil-mode
  (evil-mode t))

(use-package magit
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)
	 ("C-x c o" . helm-occur)
	 ("M-y" . helm-show-kill-ring))
  :config
  (helm-mode 1))

(use-package org
  :ensure t)
