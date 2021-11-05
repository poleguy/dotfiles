
;;; package --- Summary
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(diff-switches "-u")
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (lsp-mode use-package)))
 '(printer-name "Canon-MX882")
 ;; '(package-selected-packages (quote (flycheck use-package)))
 '(vhdl-inline-comment-column 80))

; for emacs
(setq-default tab-width 4)

(require 'package)
; https://emacs.stackexchange.com/questions/53683/melpa-failed-to-download-melpa
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;(when (< emacs-major-version 24)
   ;; For important compatibility libraries like cl-lib
  ;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(package-initialize)

;# https://jwiegley.github.io/use-package/installation/
;Once you have added your preferred archive, you need to update the local package list using:
;M-x package-refresh-contents RET
;Once you have done that, you can install use-package and its dependencies using:
;M-x package-install RET use-package RET

(require 'use-package)
;(setq lsp-vhdl-server-path "/usr/local/bin/vhdl-tool")
                                        ;(setq lsp-vhdl-server-path "/home/poleguy/fpga-data/2020/ADX5_AGC/Sweep/cenv/bin/hdl_checker")

; to install:
; conda activate base
; pip install hdl_checker
; https://melpa.org/#/getting-started
; confirm url for melpa
; m-x package-refresh-contents

;
;LSP :: The following servers support current file but do not have automatic installation configuration: lsp-vhdl
; change this path to match the installed hdl_checker

;(setq lsp-vhdl-server-path "/opt/anaconda/anaconda3/bin/hdl_checker")
(setq lsp-vhdl-server-path "/home/poleguy/.local/bin/hdl_checker")

; https://pypi.org/project/hdl-checker/
(custom-set-variables
  '(lsp-vhdl-server 'hdl-checker))

; Cannot load lsp-mode
(use-package lsp-mode
         :config
         (add-hook 'vhdl-mode-hook 'lsp))




;;(use-package flycheck  :ensure t  :init (global-flycheck-mode))

;;(flycheck-define-checker vhdl-tool
;;  "A VHDL syntax checker, type checker and linter using VHDL-Tool.
;;
;;See URL `http://vhdltool.com'."
;;  :command ("vhdl-tool" "client" "lint" "--compact" "--stdin" "-f" source
;;            )
;;  :standard-input t
;;  :error-patterns
;;  ((warning line-start (file-name) ":" line ":" column ":w:" (message) line-end)
;;   (error line-start (file-name) ":" line ":" column ":e:" (message) line-end))
;;  :modes (vhdl-mode))

;;(add-to-list 'flycheck-checkers 'vhdl-tool)


; it is important that this is before the other whitespace stuff, or it will have no effect
(custom-set-faces
  ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ( ( ((type tty) (min-colors 256))
                        (:background "black" :foreground "gray80"))
                      (t
                       (:background "white" :foreground "gray80")))
                    )
 '(whitespace-tab ((t (:background "gray95" :foreground "gray95"))))
 '(whitespace-trailing ((t (:background "gray97" :foreground "gray50"))))
 )
	




; load whitespace by default
(require 'whitespace)
(global-whitespace-mode 1)
(setq-default whitespace-style '(lines-tail))
(let ((whitespace-line-column 80) ;80 is the default
 (whitespace-style '(lines-tail))) ;or '(lines) for the whole line
 (whitespace-mode 1))

;; # https://emacs.stackexchange.com/questions/147/how-can-i-get-a-ruler-at-column-80
(set-face-attribute 'whitespace-line nil :background "gray95" :foreground 'unspecified)

; make whitespace-mode use just basic coloring;
;https://emacs.stackexchange.com/questions/22357/whitespace-mode-tab-mark-disturb-my-indentation?newreg=96fb3dc3d7354e67982b8edce0bad5ae
; not using tab-mark because of this bug
(setq whitespace-style (quote
  ( spaces tabs newline space-mark newline-mark lines-tail face trailing empty)))
;https://stackoverflow.com/questions/15946178/change-the-color-of-the-characters-in-whitespace-mode
;(set-face-attribute 'space-mark nil :background "white" :foreground "gray80")
; these are handled by custom-set-faces above!
;(set-face-attribute 'tab-mark nil :background "gray80" :foreground "gray80")
;(set-face-attribute 'spaces nil :background "gray80" :foreground "gray80")
;(set-face-attribute 'whitespace-tab nil :background "white" :foreground "gray10")



;; remove ^M's from display
(defun remove-dos-eol ()
  "Remove the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(remove-dos-eol)

(setq c-default-style "k&r"
          c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;(load "~/shurc.el")





;; load emacs 24's package system. Add MELPA repository.
;(when (>= emacs-major-version 24)
;  (require 'package)
;  (add-to-list
;   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   ;;   '("melpa" . "http://melpa.milkbox.net/packages/")   t)
   ;;   '("melpa" . "http://melpa.milkbox.net/packages/")   t)
;  )


;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun xah-replace-invisible-char ()
  "Query replace some invisible Unicode chars.
The chars to be searched are:
 ZERO WIDTH NO-BREAK SPACE (65279, #xfeff)
 ZERO WIDTH SPACE (codepoint 8203, #x200b)
 RIGHT-TO-LEFT MARK (8207, #x200f)
 RIGHT-TO-LEFT OVERRIDE (8238, #x202e)
 LEFT-TO-RIGHT MARK ‎(8206, #x200e)
 OBJECT REPLACEMENT CHARACTER (65532, #xfffc)

Search begins at cursor position. (respects `narrow-to-region')

URL `http://ergoemacs.org/emacs/elisp_unicode_replace_invisible_chars.html'
Version 2018-09-07"
  (interactive)
  (query-replace-regexp "\ufeff\\|\u200b\\|\u200f\\|\u202e\\|\u200e\\|\ufffc" ""))


;;; Commentary:


(provide '.emacs)
;;; .emacs ends here



