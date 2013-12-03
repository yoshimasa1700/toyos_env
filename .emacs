;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;;(load-file "~/.emacs.d/cedet-bzr/trunk/cedet-devel-load.el")
;;(semantic-mode 1)

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

;;(defun my-c-mode-cedet-hook ()
;;  (add-to-list 'ac-sources 'ac-source-gtags)
;;  (add-to-list 'ac-sources 'ac-source-semantic))
;;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
;;(add-hook 'c++-mode-common-hook 'my-c-mode-cedet-hook)
;;(add-hook 'latex-mode-hook 'ac-latex-mode-setup)


;;(require 'cedet)

;; CC-mode
;; (add-hook 'c++-mode-hook '(lambda ()
;;         (setq ac-sources (append '(ac-source-semantic) ac-sources))
;;         (local-set-key (kbd "RET") 'newline-and-indent)
;;         (linum-mode t)
;;         (semantic-mode t)))

;; (add-hook 'c-mode-hook '(lambda ()
;;         (setq ac-sources (append '(ac-source-semantic) ac-sources))
;;         (local-set-key (kbd "RET") 'newline-and-indent)
;;         (linum-mode t)
;;         (semantic-mode t)))

;;(global-set-key "\C-l" 'semantic-ia-complete-symbol-menu)

(require 'anything)
(require 'anything-config)
;;(global-set-key (kbd "\C-\;") 'anything) 
(global-set-key "\C-t" 'anything)

(global-set-key (kbd "\C-x\C-m") 'execute-extended-command)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/elpa/color-theme-tangotango-0.0.2/color-theme-tangotango.el")

;; (global-set-key [f2] 'semantic-ia-fast-jump)
;; (global-set-key [f4] 'ff-find-other-file)


;;(require 'flex-autopair)
;;(flex-autopair-mode 1)

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

(tool-bar-mode -1)

;;CEDETの設定
;;(load-file "~/.emacs.d/cedet/cedet-devel-load.el")

;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;;(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)
;;(add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode t)

;;(semantic-mode 1)

;; (add-to-list 'load-path "~/.emacs.d/")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)

;; (load-file "~/.emacs.d/nlinum-1.1.el")
;; ;;;nlinum-mode
;; (global-linum-mode 1)

;; (load-file "~/.emacs.d/tabbar.el")

;; ;;
;; ;; tabbar
;; ;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
;; ;; ______________________________________________________________________

;; (require 'tabbar)
;; (tabbar-mode 1)

;; ;; タブ上でマウスホイール操作無効
;; (tabbar-mwheel-mode -1)

;; ;; グループ化しない
;; (setq tabbar-buffer-groups-function nil)

;; ;; 左に表示されるボタンを無効化
;; (dolist (btn '(tabbar-buffer-home-button
;;                tabbar-scroll-left-button
;;                tabbar-scroll-right-button))
;;   (set btn (cons (cons "" nil)
;;                  (cons "" nil))))

;; ;; タブの長さ
;; (setq tabbar-separator '(1.5))

;; ;; 外観変更
;; (set-face-attribute
;;  'tabbar-default nil
;;  :family "Comic Sans MS"
;;  :background "black"
;;  :foreground "gray72"
;;  :height 1.0)
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "black"
;;  :foreground "grey72"
;;  :box nil)
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "black"
;;  :foreground "yellow"
;;  :box nil)
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box nil)
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :height 1.5)

;; ;; タブに表示させるバッファの設定
;; (defvar my-tabbar-displayed-buffers
;;   '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
;;   "*Regexps matches buffer names always included tabs.")

;; (defun my-tabbar-buffer-list ()
;;   "Return the list of buffers to show in tabs.
;; Exclude buffers whose name starts with a space or an asterisk.
;; The current buffer and buffers matches `my-tabbar-displayed-buffers'
;; are always included."
;;   (let* ((hides (list ?\  ?\*))
;;          (re (regexp-opt my-tabbar-displayed-buffers))
;;          (cur-buf (current-buffer))
;;          (tabs (delq nil
;;                      (mapcar (lambda (buf)
;;                                (let ((name (buffer-name buf)))
;;                                  (when (or (string-match re name)
;;                                            (not (memq (aref name 0) hides)))
;;                                    buf)))
;;                              (buffer-list)))))
;;     ;; Always include the current buffer.
;;     (if (memq cur-buf tabs)
;;         tabs
;;       (cons cur-buf tabs))))

;; (setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; ;; Chrome ライクなタブ切り替えのキーバインド
;; (global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)
;; (global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)

;; ;; タブ上をマウス中クリックで kill-buffer

;;   "Return the help string shown when mouse is onto TAB."
;;   (if tabbar--buffer-show-groups
;;       (let* ((tabset (tabbar-tab-tabset tab))
;;              (tab (tabbar-selected-tab tabset)))
;;         (format "mouse-1: switch to buffer %S in group [%s]"
;;                 (buffer-name (tabbar-tab-value tab)) tabset))
;;     (format "\
;; mouse-1: switch to buffer %S\n\
;; mouse-2: kill this buffer\n\
;; mouse-3: delete other windows"
;;             (buffer-name (tabbar-tab-value tab)))))

;; (defun my-tabbar-buffer-select-tab (event tab)
;;   "On mouse EVENT, select TAB."
;;   (let ((mouse-button (event-basic-type event))
;;         (buffer (tabbar-tab-value tab)))
;;     (cond
;;      ((eq mouse-button 'mouse-2)
;;       (with-current-buffer buffer
;;         (kill-buffer)))
;;      ((eq mouse-button 'mouse-3)
;;       (delete-other-windows))
;;      (t
;;       (switch-to-buffer buffer)))
;;     ;; Don't show groups.
;;     (tabbar-buffer-show-groups nil)))

;; (setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
;; (setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)


;; ;;; 対応する括弧を光らせる。
;; (show-paren-mode 1)
;; ;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)
;; ;;; 現在行を目立たせる
;; ;;(global-hl-line-mode)

;; ;;; カーソルの位置が何文字目かを表示する
;; (column-number-mode t)

;; ;;; カーソルの位置が何行目かを表示する
;; (line-number-mode t)

;; ;;; 補完可能なものを随時表示
 (icomplete-mode 1)
;; ;;; 少しうるさい
;; ;;(require 'semantic/ia)
;; ;;(require 'semantic/bovine/gcc)

;; ;; (semantic-add-system-include "/usr/include/c++/4.2.1" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/include" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/local/include" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/local/include/opencv2" 'c++-mode)

;; ;; (defun my-cedet-hook ()
;; ;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
;; ;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;; ;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;; ;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))
;; ;;   ;(local-set-key "." 'semantic-ia-complete-symbol-menu)
;; ;;   ;(local-set-key ">" 'semantic-ia-complete-symbol-menu))
;; ;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

;; ;;カラーテーマを選ぶ
;; (add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;; ;;(require 'color-theme)
;; ;;(eval-after-load "color-theme"
;; ;;  '(progn
;; ;;     (color-theme-initialize)
;; ;;     (color-theme-ld-dark)))
;; (load-file "~/.emacs.d/color-theme-tango.el")
;; ;; color-theme.el
;; (when (require 'color-theme)
;;   (color-theme-initialize)
;;    ;;color-theme-solorized.el
;; ;;  (when (require 'color-theme-solarized)
;; ;;    (color-theme-solarized-light)))

;; (color-theme-tango))

;; ;;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;; ;;(require 'color-theme)
;; ;;(eval-after-load "color-theme"
;; ;;  '(progn
;; ;;     (color-theme-initialize)
;; ;;     (color-theme-hober)))

;; ;(load-file "~/.emacs.d/tabbar.el")
;; ;(tabbar-mode)

;; ;;;背景関係を設定2008/10/04　追記
;; (modify-all-frames-parameters
;;  (list (cons 'alpha  '(100 60 60 60))))

;; ;; ;; マウスホイールでスクロール
;; (defun scroll-down-with-lines ()
;;   ""
;;   (interactive)
;;   (scroll-down 1)
;;   )
;; (defun scroll-up-with-lines ()
;;    ""
;;    (interactive)
;;    (scroll-up 1)
;; )

;; ;;キーバインドは適宜変更
;; (global-set-key [wheel-up] 'scroll-down-with-lines)
;; (global-set-key [wheel-down] 'scroll-up-with-lines)

;; ;(global-set-key "\C-w" 'backward-kill-word)
;; (global-set-key "\C-x\C-k" 'kill-region)
;; (global-set-key "\C-c\C-k" 'kill-region)

;; ;;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; (setq ring-bell-function 'ignore)

;; (global-set-key "\C-x\C-m" 'execute-extended-command)
;; (global-set-key "\C-c\C-m" 'execute-extended-command)

;; ;;; GDB 関連
;; ;;; 有用なバッファを開くモード
;; ;(setq gdb-many-windows t)
;; ;;; 変数の上にマウスカーソルを置くと値を表示
;; ;(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
;; ;;; I/O バッファを表示
;; ;(setq gdb-use-separate-io-buffer t)
;; ;;;t にすると minibufferに値が表示される
;; ;(setq gud-tooltip-echo-area nil)

;; ;フォントの設定
;; (set-face-attribute 'default nil
;;             :family "Inconsolata" ;; font
;;             :height 150)    ;; font size
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  (font-spec :family "Hiragino Maru Gothic Pro")) ;; font

;; (global-set-key "\C-xt" 'ff-find-other-file)


 ;; (set-fontset-font
 ;;  (frame-parameter nil 'font)
 ;;  'japanese-jisx0208
 ;;  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 ;; (set-fontset-font
 ;;  (frame-parameter nil 'font)
 ;;  'japanese-jisx0212
 ;;  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 ;; (set-fontset-font
 ;;  (frame-parameter nil 'font)
 ;;  'mule-unicode-0100-24ff
 ;;  '("monaco" . "iso10646-1"))
 ;; (setq face-font-rescale-alist
 ;;      '(("^-apple-hiragino.*" . 1.2)
 ;;        (".*osaka-bold.*" . 1.2)
 ;;        (".*osaka-medium.*" . 1.2)
 ;;        (".*courier-bold-.*-mac-roman" . 1.0)
 ;;        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
 ;;        (".*monaco-bold-.*-mac-roman" . 0.9)
 ;;        ("-cdac$" . 1.3)))

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


(when (>= emacs-major-version 23)
 (set-face-attribute 'default nil
                     :family "monaco"
                     :height 140)
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0208
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'japanese-jisx0212
  '("Hiragino Maru Gothic Pro" . "iso10646-1"))
 (set-fontset-font
  (frame-parameter nil 'font)
  'mule-unicode-0100-24ff
  '("monaco" . "iso10646-1"))
 (setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.0)
        (".*osaka-bold.*" . 1.0)
        (".*osaka-medium.*" . 1.0)
        (".*courier-bold-.*-mac-roman" . 0.8)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.7)
        (".*monaco-bold-.*-mac-roman" . 0.7)
        ("-cdac$" . 1.2))))

