;;; markup.el -- HTML and friends

;; nXhtml
(autoload 'nxhtml-mumamo-mode "autostart" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(html\\|ejs\\|jsp\\)$" . nxhtml-mumamo-mode))
(eval-after-load "nxhtml-mode"
  (setq mumamo-chunk-coloring 1
        rng-nxml-auto-validate-flag nil
        nxhtml-skip-welcome t))

;; Key for renaming tags
(autoload 'rename-sgml-tag "rename-sgml-tag" nil t)
(eval-after-load "nxhtml-mode"
  '(define-key nxhtml-mode-map (kbd "C-c C-r") 'rename-sgml-tag))
