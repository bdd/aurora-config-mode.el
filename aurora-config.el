;;; aurora-config.el --- Major mode for Aurora configuration files

;; Copyright (c) 2014, Berk D. Demir

;; Author: Berk D. Demir <bdd@mindcast.org>
;; URL: https://github.com/bdd/aurora-config.el
;; Version: 0.0.2
;; Created: May 2014
;; Keywords: languages, configuration

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Major mode for editing Apache Aurora configuration files.  It's derived from
;; Python mode.
;;
;; Provides side effect free Aurora client commands (currently `inspect' and
;; `diff') to test the results of changes.
;;
;; - C-c a i  runs `aurora inspect <jobpath> <config>' (`aurora-config-inspect')
;; - C-c a d  runs `aurora diff <jobpath> <config>' (`aurora-config-inspect')

;;; Installation:

;; Add this to your .emacs:

;; (add-to-list 'load-path "/path/to/aurora-config.el")
;; (require 'aurora-config)

;;; Code:
(require 'python)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.aurora\\'" . aurora-config-mode))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.mesos\\'" . aurora-config-mode))

(defconst aurora-config-aurora-struct-keywords
      '("HealthCheckConfig" "Job" "Process" "JVMProcess" "Resources" "SequentialTask" "Service"
        "Task" "UpdateConfig"))
(defconst aurora-config-pystachio-struct-keywords
      '("Enum" "Integer" "List" "Map" "String" "Struct"))

(defconst aurora-config-font-lock-keywords
      `((,(regexp-opt aurora-config-aurora-struct-keywords 'symbols) . font-lock-function-name-face)
        (,(regexp-opt aurora-config-pystachio-struct-keywords 'symbols) . font-lock-type-face)))

(defvar aurora-config-last-job-path "smf1/")

; Remember the last used job path from this buffer.
; Although `read-string' will provide history in minibuffer, it's generally irrelevant
; across different configuration files.
(make-variable-buffer-local 'aurora-config-last-job-path)

(defun aurora-config-read-jobpath ()
  "Read job path from minibuffer with history defaulting to buffer local last used."
  (setq aurora-config-last-job-path
        (read-string "Job path as 'cluster/role/env/job': "
                     aurora-config-last-job-path)))

(defun aurora-config-run-aurora (command jobpath)
  "Run `aurora COMMAND JOBPATH' with the config in current buffer."
  (let ((compile-command (mapconcat 'identity
                                   (list "aurora"
                                         command
                                         jobpath
                                         (file-name-nondirectory (buffer-file-name)))
                                   " ")))
  (compile compile-command)))

;;;###autoload
(defun aurora-config-inspect (jobpath)
  "Run `aurora inspect JOBPATH' with the config in current buffer."
  (interactive (list (aurora-config-read-jobpath)))
  (aurora-config-run-aurora "inspect" jobpath))

;;;###autoload
(defun aurora-config-diff (jobpath)
  "Run `aurora diff JOBPATH' with the config in current buffer."
  (interactive (list (aurora-config-read-jobpath)))
  (aurora-config-run-aurora "diff" jobpath))

(defvar aurora-config-mode-map
  (let ((key-map (make-sparse-keymap)))
    (define-key key-map (kbd "C-c a i") 'aurora-config-inspect)
    (define-key key-map (kbd "C-c a d") 'aurora-config-diff)
    key-map)
  "`aurora-config-mode' key map.")

;;;###autoload
(define-derived-mode aurora-config-mode python-mode "Aurora"
  "Major mode for Aurora configuration files, derived from Python mode."
  (setcar font-lock-defaults (append python-font-lock-keywords aurora-config-font-lock-keywords)))

(provide 'aurora-config-mode)

;;; aurora-config.el ends here
