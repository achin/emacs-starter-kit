;; load path
(add-to-list 'load-path "~/.emacs.d/vendor/rainbow/")
(add-to-list 'load-path "~/.emacs.d/vendor/groovy")

;; exec path
(setenv "PATH" (concat "/Library/Clojure/leiningen/bin:" (getenv "PATH")))
(setenv "LEIN_HOME" "/Library/Clojure/leiningen")

;; default font
(set-face-font 'default "-apple-Consolas-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")

;; visible bell
(setq visible-bell nil) 
 
;; allow selection deletion
(delete-selection-mode t) 

;; delete key deletes forward
(normal-erase-is-backspace-mode 1)

;; make home and end work
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)

;; turn on the menu bar
(menu-bar-mode 1) 
 
;; have emacs scroll line-by-line
(setq scroll-step 1)

;; turn off hl-line
(remove-hook 'coding-hook 'turn-on-hl-line-mode)

;; rainbow mode
(require 'rainbow-mode)

;; paredit
(defun turn-on-paredit ()
  (paredit-mode 1))

;; configure lisp modes
(defun lispify ()
  (rainbow-mode)
  (turn-on-paredit))

(add-hook 'clojure-mode-hook 'lispify)
(add-hook 'emacs-lisp-mode-hook 'lispify)

;; add paredit to slime
(defun slimeify ()
  (turn-on-paredit)
  (define-key slime-repl-mode-map ;; stop slime from grabbing del
    (read-kbd-macro paredit-backward-delete-key)
    nil))

(add-hook 'slime-repl-mode-hook 'slimeify)

;; configure html and css modes
(defun webify ()
  (rainbow-mode))

(add-hook 'html-mode-hook 'webify)
(add-hook 'css-mode-hook 'webify)

;; groovy
(require 'groovy-mode)

(global-font-lock-mode 1)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(defun groovyify ()
  (setq c-basic-offset 4))

(add-hook 'groovy-mode-hook 'groovyify)

;; start server
(server-start)
