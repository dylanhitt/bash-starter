

# entrypoint for cli based applications

set -e
cd "$(dirname "$0")"

source util/util_index.bash

_main() {
    # Parse options
    # set debug options
    # select command to run
    _text.log DEBUG "hello world"
    
}

_main