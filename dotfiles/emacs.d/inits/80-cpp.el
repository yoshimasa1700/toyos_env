;; (require 'irony)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-to-list 'company-backends 'company-irony) ; backend追加

(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 4)))
(defun my-c-c++-mode-init () (setq c-basic-offset 4) )
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

(setq-default tab-width 4 indent-tabs-mode nil)

(add-hook 'c-mode-common-hook
          (lambda () (define-key c-mode-base-map (kbd "C-c c") 'compile)))
(add-hook 'c++-mode-common-hook
          (lambda () (define-key c-mode-base-map (kbd "C-c c") 'compile)))

;; ()

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; 連想リストの中身を文字列のリストに変更せず、変数そのままの構造を利用。
;; 複数のコンパイルオプションはスペースで区切る
;; (setq irony-lang-compile-option-alist
;;       (quote ((c++-mode . "c++ -std=c++11 -lstdc++")
;;               (c-mode . "c")
;;               (objc-mode . "objective-c"))))
;; アドバイスによって関数を再定義。
;; split-string によって文字列をスペース区切りでリストに変換
;; (24.4以降 新アドバイス使用)
;; (defun ad-irony--lang-compile-option ()
;;   (defvar irony-lang-compile-option-alist)
;;   (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
;;     (when it (append '("-x") (split-string it "\s")))))
;; (advice-add 'irony--lang-compile-option :override #'ad-irony--lang-compile-option)
;; ;; (24.3以前 旧アドバイス使用)
;; (defadvice irony--lang-compile-option (around ad-irony--lang-compile-option activate)
;;   (defvar irony-lang-compile-option-alist)
;;   (let ((it (cdr-safe (assq major-mode irony-lang-compile-option-alist))))
;;     (when it (append '("-x") (split-string it "\s")))))
