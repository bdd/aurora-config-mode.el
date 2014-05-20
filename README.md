Aurora Config Mode for Emacs
----------------------------
This is the [Apache Aurora](https://aurora.incubator.apache.org/) configuration
major mode for Emacs.

Installation
------------
The mode is written and tested against GNU Emacs version 24 and may or may not
work in earlier versions.

### Install the ELPA package from MELPA.

`M-x package-install aurora-config-mode`

### Download and install with `package.el` manually
[Download](https://github.com/bdd/aurora-config.el/archive/master.zip) the
HEAD of repository and install with `M-x package-install-file`.

Commands
--------
Provides side effect free Aurora client commands (currently `inspect' and
`diff') to test the results of changes.

  - `C-c a i` runs `aurora inspect <jobpath> <config>` (invoking `aurora-config-inspect`)
  - `C-c a d` runs `aurora diff <jobpath> <config>` (invoking `aurora-config-inspect`)

Contributing
------------
`aurora-config-mode.el` lives at [https://github.com/bdd/aurora-config-mode.el]().
Pull requests are most welcome.
