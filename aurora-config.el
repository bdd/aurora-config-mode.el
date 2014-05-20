;;; aurora-config.el --- Major mode for Aurora configuration files

;; Copyright (C) 2014 Twitter, Inc.

;; Author: Berk D. Demir <bdd@twitter.com>
;; URL: https://github.com/bdd/aurora-config.el
;; Version: 0.0.1
;; Created: May 2014
;; Keywords: languages, configuration

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Major mode for editing Apache Aurora configuration files.  It's derived from Python mode.

;;; Installation:

;; Add this tyo your .emacs:

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

;;;###autoload
(define-derived-mode aurora-config-mode python-mode "Aurora"
  "Major mode for Aurora configuration files, derived form Pyton mode."
  (setcar font-lock-defaults (append python-font-lock-keywords aurora-config-font-lock-keywords)))

(provide 'aurora-config-mode)

;;; aurora-config.el ends here
