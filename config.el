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

(use-package org-bullets
  :ensure t
  :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package zenburn-theme
  :ensure t)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
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
    (yas-reload-all))
