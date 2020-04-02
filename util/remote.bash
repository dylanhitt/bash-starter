#!/usr/bin/env bash

# Utility functions for remote execution

#===  FUNCTION  ================================================================
#          NAME:  iterate_execute_func
#     PARAMETER:  $1=inventory file, $2=user
#                 $3=function to execute remotely, $@ vars
#   DESCRIPTION:  execute functions in provided host in inventory directory
#     IMPORTANT:  This function execute ssh for you
#       EXAMPLE:  _remote.iterate_execute_func
#===============================================================================
_remote.iterate_execute_func() {
    local inv_file=$1
    local user=$2
    local function=$3
    shift; shift; shift
    local vars=$@
    
    _text.log INFO "Executing function ${function}"
    while IFS= read -r line; do
        _text.log INFO "Executing function: ${function} with vars: ${vars} on host $line"
        _remotfn "$function" $vars | ssh -q root@$line
    done < ${ENV_ROOT_PATH}/inventory/$inv_file
}

_remotefn() {
    # store func in vars and shift
    local func=$1; shift
    
    type "$func" | tail -n +2
    echo "$func" "$@"
}