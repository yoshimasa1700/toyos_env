(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(package-refresh-contents)
(defvar my/favorite-packages
  '(
    auto-complete
    fuzzy
    popup
    pos-tip
    flycheck
    flymake-jslint
    flymake-cursor
    ;; for python setting.
    jedi
    py-autopep8
    flymake-python-pyflakes
    ;; for global setting.
    helm
    color-theme
    tangotango-theme
    exec-path-from-shell
    irony
    company-irony
    powerline
    ))
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
