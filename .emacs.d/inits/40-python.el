;===============
; jedi (package.elの設定より下に書く)
;===============
(require 'epc)
(require 'auto-complete-config)
(require 'python)

;;;;; PYTHONPATH上のソースコードがauto-completeの補完対象になる ;;;;;
(setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages")
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
