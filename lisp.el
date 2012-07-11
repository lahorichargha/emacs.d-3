;;; lisp.el -- Lisps

;; Paredit for all lisps
(autoload 'paredit-mode "paredit.el" nil t)
(dolist (mode '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            (lambda ()
              (autopair-mode -1)
              (paredit-mode 1))))

;;; Emacs Lisp

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (make-local-variable 'after-save-hook)
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)
