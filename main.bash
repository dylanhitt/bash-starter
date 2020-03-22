

# entrypoint for cli based applications


cd "$(dirname "$0")"

source util/util_index.bash

_main() {
    # Parse options
    # set debug options
    # select command to run
    _text.log "hello world"
    
}

_main