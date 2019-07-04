# Installation

Install with

    make install_local

# Usage

`rl` searches the current and all parent directories for an `rl.sh` file.
If it finds one, it will source it, then run the parameters to `rl` as a command.
This lets you easily use for example libraries and executables within the project without installing anything.
Add an `rl.sh` file at the root directory of the project.
To run commands within this local context, do

    rl <COMMAND>

from anywhere within the project.
While processing `rl.sh`, the `RL_ROOT` variable will be defined as the directory that `rl.sh` lives in.

# Example

    mkdir -p bin child_dir
    echo '#!/usr/bin/env sh\necho Hello World!' > bin/example
    chmod u+x bin/example
    echo 'export PATH=$RL_ROOT/bin:$PATH' > rl.sh
    cd child_dir
    rl example
