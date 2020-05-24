(require 'company)
(require 'bind-key)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(bind-key "C-h" nil company-active-map)
(bind-key "C-n" 'company-select-next company-active-map)
(bind-key "C-p" 'company-select-previous company-active-map)
(bind-key "C-n" 'company-select-next company-search-map)
(bind-key "C-p" 'company-select-previous company-search-map)
(bind-key "<tab>" 'company-indent-or-complete-common)
(bind-key "<backtab>" 'company-select-previous company-active-map)
(bind-key "C-i" 'company-complete-selection company-active-map)
(bind-key "M-d" 'company-show-doc-buffer company-active-map)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-maximum-width 50)

;; company-quickhelp
(setq company-quickhelp-color-foreground "white")
(setq company-quickhelp-color-background "dark slate gray")
(setq company-quickhelp-max-lines 5)
(company-quickhelp-mode)

(require 'eglot)

(dumb-jump-mode)
(smart-jump-setup-default-registers)

(add-hook 'python-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs
	     `(python-mode . ("pyls" "-v" "--tcp" "--host"
			      "localhost" "--port" :autoport)))
