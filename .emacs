;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; 検索(全般)時には大文字小文字の区別をしない 
(setq case-fold-search t) 
;; インクリメンタルサーチ時には大文字小文字の区別をしない 
(setq isearch-case-fold-search t)

 ;; バッファー名の問い合わせで大文字小文字の区別をしない 
(setq read-buffer-completion-ignore-case t) 
;; ファイル名の問い合わせで大文字小文字の区別をしない 
(setq read-file-name-completion-ignore-case t)
(setq case-replace nil)


(setq mouse-wheel-progressive-speed nil)
 (setq scroll-conservatively 1)

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130503.2013/dict")
(ac-config-default)

(require 'ac-python)
(add-to-list 'ac-modes 'python-2-mode)

(require 'ac-math)
(require 'ac-ja)

(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands ac-dabbrev-ja-expand)
                ac-sources))
  )

(require 'anything)
(require 'anything-config)

(global-set-key "\C-t" 'anything)
(global-set-key (kbd "\C-x\C-m") 'execute-extended-command)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/elpa/color-theme-tangotango-0.0.2/color-theme-tangotango.el")

(require 'flymake)

 (defun flymake-cc-init ()
   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                        'flymake-create-temp-inplace))
          (local-file  (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
     (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

 (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
 (push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c++-mode-hook
           '(lambda ()
              (flymake-mode t)))

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)
;; off tool bar
(tool-bar-mode -1)
;; 現在行を目立たせる
(global-hl-line-mode)

;; ;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; ;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; ;;; 補完可能なものを随時表示
 (icomplete-mode 1)

;; setting for helm
(global-set-key "\C-xi" `helm-imenu)

;; 検索(全般)時には大文字小文字の区別をしない 
(setq case-fold-search t) 
;; インクリメンタルサーチ時には大文字小文字の区別をしない 
(setq isearch-case-fold-search t)

(setq inhibit-startup-message t)
(setq make-backup-files nil)

;;(add-to-list 'load-path "~/Emacs/emmet/")
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
(keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開
(require 'web-mode)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;;; インデント数
;; (defun web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-html-offset   2)
;;   (setq web-mode-css-offset    2)
;;   (setq web-mode-script-offset 2)
;;   (setq web-mode-php-offset    2)
;;   (setq web-mode-java-offset   2)
;;   (setq web-mode-asp-offset    2))
;; (add-hook 'web-mode-hook 'web-mode-hook)

					; mmm-mode in php
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
(mmm-add-classes
 '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)


(global-linum-mode t)

(load-file "~/.emacs.d/elpa/google-c-style-20130412.1415/google-c-style.el")
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)
