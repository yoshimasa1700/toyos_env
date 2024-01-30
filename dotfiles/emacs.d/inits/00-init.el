;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)
(setq case-replace nil)

(setq mouse-wheel-progressive-speed nil)
(setq scroll-conservatively 1)

;; 対応する括弧を光らせる。
(show-paren-mode 1)
;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;; off tool bar
(tool-bar-mode -1)
;; off menu bar
(menu-bar-mode -1)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; 補完可能なものを随時表示
(icomplete-mode 1)

;; 検索(全般)時には大文字小文字の区別をしない
(setq case-fold-search t)
;; インクリメンタルサーチ時には大文字小文字の区別をしない
(setq isearch-case-fold-search t)

(setq inhibit-startup-message t)
(setq make-backup-files nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(global-linum-mode t)

(setq-default tab-width 2 indent-tabs-mode nil)

(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)
