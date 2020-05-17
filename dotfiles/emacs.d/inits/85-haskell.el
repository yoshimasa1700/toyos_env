(autoload 'haskell-mode "haskell-mode" nil t)
;; (autoload 'haskell-cabal "haskell-cabal" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
;; (add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(global-company-mode 1) ;; company-mode を常に ON
(add-to-list 'company-backends 'company-ghc)
(add-to-list 'company-backends 'company-ghci)

(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-type 'ghci)
(setq haskell-process-path-ghci "ghci")
(setq haskell-process-args-ghci "")


(defun my-haskell-mode-hook ()
    (interactive)
    ;; インデント
    (turn-on-haskell-indentation)
    (turn-on-haskell-doc-mode)
    (font-lock-mode)
    (imenu-add-menubar-index)
    ;; GHCi のコマンドを設定
    (setq haskell-program-name "/usr/bin/ghci") ;; stack の場合
    (inf-haskell-mode)
    ;; ghc-mod を使えるように
    (ghc-init)
    ;; flycheck を起動
    (flycheck-mode))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
