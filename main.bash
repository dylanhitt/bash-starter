

# entrypoint for cli based applications


cd "$(dirname "$0")"

source util/util_index.bash

_main() {
    # Parse options
    # set debug options
    # select command to run
    numbers=(1 2 3)
    
    if  _util.array.contains 3 numbers; then
        echo "does contain"
    fi
    
    _util.text.special_print yellow bold "Hello red world"
}

_main