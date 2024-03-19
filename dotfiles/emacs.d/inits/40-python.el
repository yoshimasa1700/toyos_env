;; setting for eglog.
;; for use Language Server Protocol.
(require 'eglot)

(add-hook 'python-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs
	     `(python-mode . ("pylsp" "-v" "--tcp" "--host"
			      "localhost" "--port" :autoport)))
(define-key global-map (kbd "M-d") 'eldoc-doc-buffer)


;; setting for smart jump.
;; for set jump to definition and back.
(require 'smart-jump)
(smart-jump-setup-default-registers)

(define-key global-map (kbd "C-j") 'smart-jump-go)
(define-key global-map (kbd "C-u") 'smart-jump-back)
