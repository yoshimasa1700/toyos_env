;; setting for jedi.
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
(setenv "PYTHONPATH" "/home/masahiko/.local/lib/python2.7/site-packages")

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq ac-sources
 (delete 'ac-source-words-in-same-mode-buffers ac-sources))

;; setting for autopep8.
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;; flymake.
(add-hook 'python-mode-hook 'flymake-mode)
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
