Aurora Config Mode for Emacs
----------------------------

This is the [Apache Aurora](https://aurora.incubator.apache.org/) configuration
major mode for Emacs.

Installation
------------
GNU Emacs version 23 or later is supported.

Depending on the interest, we may post the package to ELPA and compatible
repositories (e.g. MELPA, Marmalade).  For now the only supported way to install
this mode is to it download `aurora-config.el` and add its path to your
[`load-path`](http://www.emacswiki.org/emacs/LoadPath), followed by activating
it for [autoloading](https://www.gnu.org/software/emacs/manual/html_node/elisp/Autoload.html)

```el
(add-to-list 'load-path "/path/to/aurora-config.el")
(require 'aurora-config)
```

Contributing
------------
`aurora-config.el` lives at [http://github.com/bdd/autoload.el]().  Pull requests
are most welcome.


