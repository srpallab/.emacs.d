(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'org-structure-template-alist
		 '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  "Reloads ~/.emacs.d/config.org at runtime"
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(setq inhibit-startup-message t)

(use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setenv "BROWSER" "firefox")

(add-hook 'org-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'yas-minor-mode)

(use-package htmlize
  :ensure t)

(use-package org-bullets
  :ensure t
  :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))
(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/plantuml.jar"))

(use-package plantuml-mode
  :ensure t)

(use-package zerodark-theme
  :ensure t
  :init
    (load-theme 'zerodark t))

(let ((class '((class color) (min-colors 89)))
      (default (if (true-color-p) "#abb2bf" "#afafaf"))
      (light (if (true-color-p) "#ccd4e3" "#d7d7d7"))
      (background (if (true-color-p) "#282c34" "#333333"))
      (background-dark (if (true-color-p) "#24282f" "#222222"))
      (background-darker (if (true-color-p) "#22252c" "#222222"))
      (mode-line-inactive (if "#1c2129" "#222222"))
      (mode-line-active (if (true-color-p) "#6f337e" "#875f87"))
      (background-lighter (if (true-color-p) "#3a3f4b" "#5f5f5f"))
      (background-red (if (true-color-p) "#4c3840" "#5f5f5f"))
      (bright-background-red (if (true-color-p) "#744a5b" "#744a5b"))
      (background-purple (if (true-color-p) "#48384c" "#5f5f5f"))
      (background-blue (if (true-color-p) "#38394c" "#444444"))
      (bright-background-blue (if (true-color-p) "#4e5079" "#4e5079"))
      (background-green (if (true-color-p) "#3d4a41" "#5f5f5f"))
      (bright-background-green (if (true-color-p) "#3f6d54" "#3f6d54"))
      (background-orange (if (true-color-p) "#4a473d" "#5f5f5f"))
      (hl-line (if (true-color-p) "#2c323b" "#333333"))
      (grey (if (true-color-p) "#cccccc" "#cccccc"))
      (grey-dark (if (true-color-p) "#666666" "#666666"))
      (highlight (if (true-color-p) "#3e4451" "#5f5f5f"))
      (comment (if (true-color-p) "#687080" "#707070"))
      (orange (if (true-color-p) "#da8548" "#d7875f"))
      (orange-light (if (true-color-p) "#ddbd78" "#d7af87"))
      (red (if (true-color-p) "#ff6c6b" "#ff5f5f"))
      (purple (if (true-color-p) "#c678dd" "#d787d7"))
      (purple-dark (if (true-color-p) "#64446d" "#5f5f5f"))
      (blue (if (true-color-p) "#61afef" "#5fafff"))
      (blue-dark (if (true-color-p) "#1f5582" "#005f87"))
      (green (if (true-color-p) "#98be65" "#87af5f"))
      (green-light (if (true-color-p) "#9eac8c" "#afaf87"))
      (peach "PeachPuff3")
      (diff-added-background (if (true-color-p) "#284437" "#284437"))
      (diff-added-refined-background (if (true-color-p) "#1e8967" "#1e8967"))
      (diff-removed-background (if (true-color-p) "#583333" "#580000"))
      (diff-removed-refined-background (if (true-color-p) "#b33c49" "#b33c49"))
      (diff-current-background (if (true-color-p) "#29457b" "#29457b"))
      (diff-current-refined-background (if (true-color-p) "#4174ae" "#4174ae")))

  (custom-theme-set-faces
   'zerodark

   `(fancy-battery-charging ((,class (:background ,background-blue :height 1.0 :bold t))))
   `(fancy-battery-discharging ((,class (:background ,background-blue :height 1.0))))
   `(fancy-battery-critical ((,class (:background ,background-blue :height 1.0))))

   ;; mode line stuff
   `(mode-line ((,class (:background ,background-blue :height 1.0 :foreground ,blue
				     :distant-foreground ,background-blue
				     :box ,(when zerodark-use-paddings-in-mode-line
					     (list :line-width 6 :color background-blue))))))

   `(mode-line-inactive ((,class (:background ,background-blue :height 1.0 :foreground ,default
					      :distant-foreground ,background-blue
					      :box ,(when zerodark-use-paddings-in-mode-line
						      (list :line-width 6 :color background-blue))))))

   `(header-line ((,class (:inherit mode-line-inactive))))

   `(powerline-active0 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					 :distant-foreground ,background-blue))))
   `(powerline-active1 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					 :distant-foreground ,background-blue))))
   `(powerline-active2 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					 :distant-foreground ,background-blue))))
   `(powerline-inactive0 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					   :distant-foreground ,background-blue))))
   `(powerline-inactive1 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					   distant-foreground ,background-blue))))
   `(powerline-inactive2 ((,class (:height 1.0 :foreground ,blue :background ,background-blue
					   :distant-foreground ,background-blue))))

   `(dashboard-heading-face ((,class (:background ,background :foreground ,blue
						  :bold t :height 1.2))))
   `(dashboard-banner-logo-title-face ((,class (:background ,background :foreground ,blue
							    :bold t :height 1.2))))
   `(widget-button ((,class (:background ,background :foreground ,default :bold nil
					 :underline t :height 0.9))))

   ;; erc stuff
   `(erc-nick-default-face ((,class :foreground ,blue :background ,background :weight bold)))

   ;; org stuff
   `(outline-1 ((,class (:foreground ,blue :weight bold :height 1.8 :bold nil))))
   `(outline-2 ((,class (:foreground ,purple :weight bold :height 1.7 :bold nil))))
   `(outline-3 ((,class (:foreground ,peach :weight bold :height 1.6 :bold nil))))
   `(outline-4 ((,class (:foreground ,green-light :weight bold :height 1.5 :bold nil))))
   `(outline-5 ((,class (:foreground ,blue :weight bold :height 1.4 :bold nil))))
   `(outline-6 ((,class (:foreground ,purple :weight bold :height 1.3 :bold nil))))
   `(outline-7 ((,class (:foreground ,peach :weight bold :height 1.2 :bold nil))))
   `(outline-8 ((,class (:foreground ,green-light :weight bold :height 1.1 :bold nil))))

   `(org-block-begin-line ((,class (:background ,background-blue :foreground ,blue
						:bold t :height 1.0))))
   `(org-block-end-line ((,class (:background ,background-blue :foreground ,blue
					      :bold t :height 1.0))))))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

(use-package magit
    :ensure t
    :init
    (progn
    (bind-key "C-x g" 'magit-status)))
(setq magit-status-margin
  '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(use-package git-timemachine
  :ensure t)
(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode +1))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  (setq dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda . 5))))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (use-package yasnippet-classic-snippets
    :ensure t)
  (yas-reload-all))

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))


(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(use-package iedit
  :ensure t)

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "SPC") #'company-abort))

(use-package elpy
  :ensure t
  :defer t
  :bind (("C-c k" . yas-expand)
	 ("C-c o" . iedit-mode))
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (setq python-shell-interpreter "jupyter"
	python-shell-interpreter-args "console --simple-prompt"
	python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
  (when (load "flycheck" nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))))

(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package ein
  :ensure t)

(use-package origami
  :ensure t)

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(use-package ace-window
  :ensure t
  :config
  (setq aw-scope 'global)
  (global-set-key (kbd "C-x 0") 'other-frame)
  (global-set-key [remap other-window] 'ace-window))

(use-package posframe
  :ensure t)

(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  (require 'smartparens-config))
(show-paren-mode t)

(use-package multiple-cursors
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  (setq web-mode-engines-alist '(("django" . "\\.html\\'")))
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-quoting t))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package diminish
  :ensure t
  :init
  (diminish 'which-key-mode)
  (diminish 'hungry-delete-mode)
  (diminish 'company-mode)
  (diminish 'git-gutter-mode)
  )

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-current-symbol "")
  (add-hook 'prog-mode-hook 'linum-relative-mode))
