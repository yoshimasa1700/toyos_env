;; for indent setting.

(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
  )

(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;; setting for trailing whitespace.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs `(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs `(c-mode . ("clangd")))

(setq c-default-style
      '((c++-mode . "bsd")
        (c-mode . "bsd")))

;; for CUDA Program
;;; https://github.com/chachi/cuda-mode
(use-package cuda-mode)

;; add path manually;
(add-hook 'cuda-mode-hook
          (lambda ()
            ( setq c-basic-offset              4
                   flycheck-cuda-include-path (list "."))
            ))

;; later, after irony is loaded
;; (push 'cuda-mode company-supported-major-modes)
