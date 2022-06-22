Adds two executable shell scripts, `rl` and `rlmk`

# Installation

Install with

    make install

# Usage

`rl` searches the current and all parent directories for an `rl.sh` file.
If it finds one, it will source it then run the arguments to `rl` as a command.
This lets you easily use for example libraries and executables within the project without installing anything.
Add an `rl.sh` file at the root directory of the project.
To run commands within this local context, do

    rl <COMMAND>

from anywhere within the project.
While processing `rl.sh`, the `RL_ROOT` variable will be defined as the directory that `rl.sh` lives in.

# `rl` Example

    mkdir -p bin child_dir
    echo '#!/usr/bin/env sh\necho Hello World!' > bin/example
    chmod u+x bin/example
    echo 'export PATH=$RL_ROOT/bin:$PATH' > rl.sh
    cd child_dir
    rl example

The script `bin/example` is found and executed on the last line, even from some other directory, because `rl.sh` adds it to the `PATH`.

# `rlmk`

`rlmk` is a shortcut to run `make` in the same directory as the `rl.sh` found by `rl`.
Extra arguments are passed through to the `make` invocation.
This may be useful to quickly run `PHONY` targets from anywhere in the project tree.

`rlmk` doesn't automatically include the enviroment set up by `rl`. This is a deliberate design choice to discourage unintentially writing Makefiles that only work when run with `rl`. To run the Makefile with the `rl` enviroment, either run `rl` as needed within the Makefile or prefix the `rlmk` invocation with `rl` as you would with other commands:

    rl rlmk <MAKE TARGET>
