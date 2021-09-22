;; (require 'ivy)
;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (setq enable-recursive-minibuffers t)
;; (setq ivy-height 30)
;; (setq ivy-extra-directories nil)
;; (setq ivy-re-builders-alist
;;       '((t . ivy--regex-plus)))

;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (setq counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

;; (global-set-key "\C-s" 'swiper)
;; (setq swiper-include-line-number-in-search t)

(global-set-key (kbd "M-y") 'counsel-yank-pop)
