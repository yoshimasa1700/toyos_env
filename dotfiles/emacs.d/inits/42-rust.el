;; (add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; #rust

;; (use-package rust-mode
;;   :ensure t
;;   :custom rust-format-on-save t)


;; (use-package cargo
;;   :ensure t
;;   :hook (rust-mode . cargo-minor-mode))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; #lsp

;; ;; (use-package lsp-mode
;; ;;   :ensure t
;; ;;   :init (yas-global-mode)
;; ;;   :hook (rust-mode . lsp)
;; ;;   :bind ("C-c h" . lsp-describe-thing-at-point)
;; ;;   :custom (lsp-rust-server 'rls))
;; ;; (use-package lsp-ui
;; ;;   :ensure t)

;; (add-hook 'rust-mode-hook 'eglot-ensure)
;; (add-to-list 'eglot-server-programs `(rust-mode . ("rust-analyzer")))
