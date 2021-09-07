;; (require 'package)
;; (setq package-archives
;;       '(("melpa" . "https://melpa.org/packages/")
;;         ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
;;         ("org" . "https://orgmode.org/elpa/")
;;         ("gnu" . "https://elpa.gnu.org/packages/")))

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
;;     yaml-mode

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
