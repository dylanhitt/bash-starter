#!/usr/bin/env bash

# entrypoint for cli based applications


cd "$(dirname "$0")"

source util/util_index.bash

_main() {
    # Parse options
    # set debug options
    # select command to run
    string="hello"
    numbers=(1 2 3)

    if  _util.array.contains 3 numbers; then 
        echo "does contain"
    fi

    Gre='\e[0;32m'
    RCol='\e[0m' 
    echo -e "${Gre}blue hello${RCol}"
}

_main 