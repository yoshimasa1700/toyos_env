;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (package-initialize)

;; (package-refresh-contents)
;; (defvar my/favorite-packages
;;   '(
;;     ;; packages for global setting.
;;     exec-path-from-shell
;;     ivy
;;     counsel
;;     powerline
;;     bind-key

;;     ;; packages for coding.
;;     eglot
;;     smart-jump

;;     ;; packages setting for auto completion
;;     company

;;     ;; packages for python
;;     py-autopep8
;;     flymake-python-pyflakes

;;     ;; haskell
;;     haskell-mode))

;; (dolist (package my/favorite-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))
