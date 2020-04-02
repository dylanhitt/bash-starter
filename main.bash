

# entrypoint for cli based applications


set -o errexit
set -o errtrace
set -o functrace
set -o pipefail

export ENV_ROOT_PATH=$(pwd)

cd "$(dirname "$0")"

source util/util_index.bash

handle_error() {
    
    # ANY CLEAN UP GOES HERE #
    
    local line_number=$1
    local failed_command=$2
    _text.log ERROR "Error occured on $line_number with command $failed_command"
}

trap 'handle_error $LINENO "$BASH_COMMAND"' ERR

_main() {
    echo hello | grep fool
}

_main





