
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

;;; flymake
(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)
 
(add-to-list 'flymake-err-line-patterns
             ;; g++ 4.7
             '("\\([^:]+\\):\\([0-9]+\\):\\(\\([0-9]+\\):\\)? \\(\\(error\\|warning\\): \\(.+\\)\\)" 1 2 4 5))
 
(defun flymake-show-and-sit ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (progn
    (let* ((line-no (flymake-current-line-no) )
           (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (count (length line-err-info-list)))
      (while (> count 0)
        (when line-err-info-list
          (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
                 (full-file
                  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
                 (text (flymake-ler-text (nth (1- count) line-err-info-list)))
                 (line (flymake-ler-line (nth (1- count) line-err-info-list))))
            (message "[%s] %s" line text)))
        (setq count (1- count)))))
  (sit-for 60.0))
 (global-set-key "\C-ce" 'flymake-show-and-sit)
 
(defun flymake-simple-generic-init (cmd &optional opts)
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list cmd (append opts (list local-file)))))
(defun makefile-exists (dir)
  (if (file-exists-p (concat dir "Makefile")) t
    (let ((padir (file-name-directory (directory-file-name dir))))
      (if (and (not (string= dir padir)) padir) (makefile-exists padir) nil))))
(defun flymake-simple-make-or-generic-init (cmd &optional opts)
  (if (makefile-exists default-directory)
      (flymake-simple-make-init)
    (flymake-simple-generic-init cmd opts)))
(defun flymake-c-init ()
  (flymake-simple-make-or-generic-init
   "gcc" '("-Wall" "-Wextra" "-Wno-trigraphs" "-fopenmp" "-fsyntax-only")))
(defun flymake-cc-init ()
  (flymake-simple-make-or-generic-init
   "g++" '("-Wall" "-Wextra" "-Wno-trigraphs" "-fopenmp" "-fsyntax-only")))
(push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
(push '("\\.\\(cc\\|cpp\\|cxx\\|h\\|hpp\\)\\'" flymake-cc-init)
      flymake-allowed-file-name-masks)
 
;;; flymake-tex
(defun flymake-get-tex-args (file-name)
  (list "/usr/texbin/platex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;; 	 (local-file  (file-relative-name
;; 		       temp-file
;; 		       (file-name-directory buffer-file-name))))
;;     (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.hpp$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (add-hook 'c++-mode-hook
;; 	  '(lambda ()
;; 	     (flymake-mode t)))

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)
;; off tool bar
(tool-bar-mode -1)


(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray0"))
    (((class color)
      (background light))
     (:background "SeaGreen" :))
    (t
     ()))
  "Used face hl-line.")
(setq hl-line-face 'hlline-face)
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
;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'html-mode-hook 'emmet-mode)
;; (add-hook 'css-mode-hook  'emmet-mode)
;; (add-hook 'web-mode-hook  'emmet-mode)
;; (eval-after-load "emmet-mode"
;;   '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
;; (keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
;; (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開
;; (require 'web-mode)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
;; (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

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
;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;; (mmm-add-classes
;;  '((html-php
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>")))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; (require 'flymake-sass)
;; (add-hook 'sass-mode-hook 'flymake-sass-load)
;; (add-hook 'scss-mode-hook 'flymake-sass-load)


(global-linum-mode t)

(load-file "~/.emacs.d/elpa/google-c-style-20130412.1415/google-c-style.el")
(require 'google-c-style)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

;; Mac用フォント設定
;; http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/

;; 英語
;; (set-face-attribute 'default nil
;; 		    :family "Menlo" ;; font
;; 		    :height 120)    ;; font size

;; 日本語
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
;;  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;; 半角と全角の比を1:2にしたければ
;;(setq face-font-rescale-alist
;;      '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.0)));; Mac用フォント設定

