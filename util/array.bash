#!/usr/bin/env bash

# Utility functions for common array functions

#===  FUNCTION  ================================================================
#          NAME:  contains
#     PARAMETER:  $1=value to check, $2=name reference to array
#        RETURN:  new array with added value
#   DESCRIPTION:  returns a new array with value added
#       EXAMPLE:  _array.contains "$test_element" "array"
#===============================================================================
_array.contains() {
    array.is_array ${2}
    local test_element=$1
    local array_reference=$2[@]
    local test_array=("${!array_reference}")
    for __test_element in "${test_array[@]:-}"; do
        if [[ "${__test_element}" == "${1}" ]]; then
            return 0
        fi
    done
    return 1
}

#===  FUNCTION  ================================================================
#          NAME:  is_array
#     PARAMETER:  $1=array
#        RETURN:  returns 0 if true 1 if false
#   DESCRIPTION:  returns a new array with value added
#===============================================================================
_array.is_array() {
    local array_name=$1
    if [[ "$(declare -p $array_name)" =~ "declare -a" ]]; then
        return 0
    else
        _log "Input is not an array"
        exit 1
    fi
}
