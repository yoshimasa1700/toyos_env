;; setting for company.
;; for smart complement.
(require 'company)
(require 'bind-key)

(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(setq company-idle-delay 0)
(setq company-backends '((company-capf)))

(bind-key "C-h" nil company-active-map)
(bind-key "C-n" 'company-select-next company-active-map)
(bind-key "C-p" 'company-select-previous company-active-map)
(bind-key "C-n" 'company-select-next company-search-map)
(bind-key "C-p" 'company-select-previous company-search-map)
(bind-key "<tab>" 'company-indent-or-complete-common)
(bind-key "<backtab>" 'company-select-previous company-active-map)
(bind-key "C-i" 'company-complete-selection company-active-map)
;; (bind-key "M-d" 'company-show-doc-buffer company-active-map)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-maximum-width 50)
