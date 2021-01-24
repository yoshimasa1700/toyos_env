;; setting for company.
;; for smart complement.
(require 'company)
(require 'bind-key)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

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

;; open documentation permanently on buffer.
(defun my/company-show-doc-buffer ()
  "Temporarily show the documentation buffer for the selection."
  (interactive)
  (let* ((selected (nth company-selection company-candidates))
         (doc-buffer (or (company-call-backend 'doc-buffer selected)
                         (error "No documentation available"))))
    (with-current-buffer doc-buffer
      (goto-char (point-min)))
    (display-buffer doc-buffer t)))
(define-key company-active-map (kbd "M-d") #'my/company-show-doc-buffer)

(global-company-fuzzy-mode 1)


;; setting for eglog.
;; for use Language Server Protocol.
(require 'eglot)

(add-hook 'python-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs
	     `(python-mode . ("pyls" "-v" "--tcp" "--host"
			      "localhost" "--port" :autoport)))


;; setting for smart jump.
;; for set jump to definition and back.
(require 'smart-jump)
(smart-jump-setup-default-registers)

(define-key global-map (kbd "C-j") 'smart-jump-go)
(define-key global-map (kbd "C-u") 'smart-jump-back)
