;; for indent setting.

(defun my-c-c++-mode-init ()
  (setq c-basic-offset 2)
  )

(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;; setting for trailing whitespace.
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)    ;; Pythonファイルで自動的にlsp-modeを有効化
         (js-mode . lsp)        ;; JavaScriptファイルで自動的にlsp-modeを有効化
         (c++-mode . lsp)       ;; C++ファイルで自動的にlsp-modeを有効化
         (c-mode . lsp))        ;; Cファイルで自動的にlsp-modeを有効化
  :commands lsp)

;; (setq lsp-clients-clangd-executable "/usr/bin/clangd")
;; (setq lsp-clangd-binary-path "/usr/bin/clangd")
(setq lsp-clangd-binary-path "/home/toyoshi_dev/Programs/clangd_15.0.6/bin/clangd")

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t      ;; ドキュメントのポップアップを有効化
        lsp-ui-doc-position 'at-point))  ;; カーソル位置に表示

;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-to-list
;;  'eglot-server-programs
;;  `(c++-mode . ("/usr/bin/clangd" "--query-driver=/usr/bin/c++" "--clang-tidy" "--completion-style=detailed" "--header-insertion=iwyu")))

;; ;; "--background-index=true" "--all-scopes-completion=true"

;; (add-to-list
;;  'eglot-server-programs
;;  `(c-mode . ("/usr/bin/clangd  --query-driver=/usr/bin/c++" "--clang-tidy" "--completion-style=detailed" "--header-insertion=iwyu")))

(setq compile-command "cd /home/toyoshi/Programs/deepsee3d/build; make -j20")

(setq c-default-style
      '((c++-mode . "bsd")
        (c-mode . "bsd")))

;; for CUDA Program
;;; https://github.com/chachi/cuda-mode
;; (use-package cuda-mode)

;; add path manually;
(add-hook 'cuda-mode-hook
          (lambda ()
            ( setq c-basic-offset              2
                   flycheck-cuda-include-path (list "."))
            ))

;; later, after irony is loaded
;; (push 'cuda-mode company-supported-major-modes)
