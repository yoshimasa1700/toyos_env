;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(global-set-key (kbd "C-x C-m") 'execute-extended-command)


;; メニューバーを消す
(menu-bar-mode 0)
(tool-bar-mode 0)

;; auto-complete
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
;;(require 'auto-complete)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
;;(global-auto-complete-mode t)

;; (defun my-c-mode-cedet-hook ()
;;   (add-to-list 'ac-sources 'ac-source-gtags)
;;   (add-to-list 'ac-sources 'ac-source-semantic))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;; (add-hook 'c++-mode-common-hook 'my-c-mode-cedet-hook)

 ;; 検索(全般)時には大文字小文字の区別をしない
 (setq case-fold-search t)
 
 ;; インクリメンタルサーチ時には大文字小文字の区別をしない
 (setq isearch-case-fold-search t)

 ;; バッファー名の問い合わせで大文字小文字の区別をしない 
(setq read-buffer-completion-ignore-case t) 
;; ファイル名の問い合わせで大文字小文字の区別をしない 
(setq read-file-name-completion-ignore-case t) 

(load-theme 'tango-dark)

(setq inhibit-startup-message t)

