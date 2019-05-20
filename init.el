;; ======================================================================
;;  ENV
;; ======================================================================
;; (setq load-path
;;       (append load-path
;;               '("~/.emacs.d/inits/")))

;; shell pass
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(setenv "LANG" "en_US.UTF-8")


;; ======================================================================
;;  EDITOR APPEARANCE
;; ======================================================================
;; -- window  ------------------------------------------------[
(if window-system
	(progn
	  (set-background-color "Black")
	  (set-foreground-color "LightGray")
	  (set-cursor-color     "Gray")
	  (set-frame-parameter nil 'alpha 100)))
;; ]-----------------------------------------------------------

;; -- title --------------------------------------------------[
(setq frame-title-format
      (format "%%b - %s-%s@%s" invocation-name emacs-version system-name))
      ;; %b : バッファ名
      ;; invocation-name : emacs のプログラム名
      ;; emacs-version : emacs のバージョン
      ;; system-name : ホスト名
;; ]-----------------------------------------------------------

;; -- bars ---------------------------------------------------[
(menu-bar-mode 0)
(if window-system (progn
                    (tool-bar-mode 0)
                    (scroll-bar-mode 0)))
;; ]-----------------------------------------------------------

;; -- cursor -------------------------------------------------[
(set-cursor-color "orange")
(setq cursor-type 'box)
(add-to-list 'default-frame-alist '(cursor-type . 'box))
(setq blink-cursor-interval 0.8)
(setq blink-cursor-delay 1.3)
(blink-cursor-mode 1)
;; ]-----------------------------------------------------------

;; -- syntax highlight ---------------------------------------[
(show-paren-mode t)        ; highlight parenthesis set
(setq-default show-trailing-whitespace t)
;; ]-----------------------------------------------------------



;; ======================================================================
;;  SYSTEM
;; ======================================================================
;; -- no startup message -------------------------------------[
(setq inhibit-startup-message t)
;; ]-----------------------------------------------------------

;; -- backup and autosave ------------------------------------[
(setq make-backup-files t)
(add-to-list 'backup-directory-alist         ; backup~
       (cons "\\.*$" (expand-file-name "~/.emacs.d/backup/")))

(setq auto-save-file-name-transforms         ; #autosave#
       `((".*", (expand-file-name "~/.emacs.d/autosave/") t)))
;; ]-----------------------------------------------------------

;; -- path
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path
         (append (list dir) exec-path))))



;; ======================================================================
;;  MISC (MINIMAL SETTINGS)
;; ======================================================================
(setq-default tab-width 2
              indent-tabs-mode nil)

(global-set-key "\C-h" 'delete-backward-char)



;; ======================================================================
;;  PACKAGE
;; ======================================================================
;; -- el-get -------------------------------------------------[
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
;; ]-----------------------------------------------------------

;; -- init-loader --------------------------------------------[
(el-get-bundle init-loader)
(init-loader-load)
;; ]-----------------------------------------------------------
