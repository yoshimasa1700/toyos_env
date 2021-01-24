;; for indent setting.
(add-hook 'c-mode-hook
          '(lambda () (setq tab-width 2)))
(add-hook 'c++-mode-hook
          '(lambda () (setq tab-width 2)))
(defun my-c-c++-mode-init () (setq c-basic-offset 2) )
(add-hook 'c-mode-hook
          'my-c-c++-mode-init)
(add-hook 'c++-mode-hook
          'my-c-c++-mode-init)


;; setting for trailing whitespace.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs `(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs `(c-mode . ("clangd")))
