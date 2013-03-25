;; loadpath; this will recursivel add all dirs in 'elisp-path' to load-path 
(defconst elisp-path '("~/.emacs.d/elisp/")) ;; my elisp directories
(mapcar '(lambda(p)
           (add-to-list 'load-path p) 
           (cd p) (normal-top-level-add-subdirs-to-load-path)) elisp-path)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete)

(global-auto-complete-mode t)

(global-font-lock-mode t)

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;Para quitar la pantalla de inicio
;;(setq inhibit-splash-screen t)

;; Use php-mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))


;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
  )

;; Despliega la Linea y la columna en el Mode-Line
(line-number-mode 1)
(setq column-number-mode t)

(set-background-color "dark slate gray")
(set-foreground-color "blanched almond")

;; Detente al final del archivo, no metas mas lineas
(setq next-line-add-newlines nil)

;; Quitar la barra de herramientas
(tool-bar-mode 0)

;; Display the time in the mode line
;(setq display-time-24hr-format t)
(display-time)

; make file name and computer title
(set-default 'frame-title-format 
             (list "" "emacs" "@" (getenv "HOST") " : %f" ))

;;Para quitar esos pinches
(defun dos-to-unix ()
  "Convert a DOS buffer to Unix format."
  (interactive)
  (beginning-of-buffer)
  (replace-string "\r\n" "\n"))

;; Shorcuts utiles
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-j" 'capitalize-region)
(global-set-key "\M-r" 'replace-regexp)

; Associate c-mode with the .js extension
(setq auto-mode-alist (append '(("\\.js$" . c-mode)) auto-mode-alist))


;; Indenta todo el codigo dentro del buffer, se usa con M-x iwb
(defun iwb()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  )

;; CSS Mode (editing Cascading Style Sheet files)
;; http://www.garshol.priv.no/download/software/css-mode/index.html
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
					; use C-style indenting in CSS mode
(setq cssm-indent-function #'cssm-c-style-indenter)

;;Autoformato, agrega caracter de cierre
(setq skeleton-pair t)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "'" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

;Resalta los parentesis para saber donde abren y donde cierran
(show-paren-mode t)
(setq show-paren-style 'mixed)