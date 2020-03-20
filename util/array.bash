#!/usr/bin/env bash

# Utility functions for common array functions

#===  FUNCTION  ================================================================
#          NAME:  contains
#     PARAMETER:  $1=value to check, $2=name reference to array
#        RETURN:  new array with added value
#   DESCRIPTION:  returns a new array with value added
#       EXAMPLE:  _util.array.contains "$test_element" "array"
#===============================================================================
_util.array.contains() {
    _util.array.is_array ${2}
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
_util.array.is_array() {
    local array_name=$1
    if [[ "$(declare -p $array_name)" =~ "declare -a" ]]; then
        return
    else
        echo "The input provdided was not an array!"
        exit 1
    fi
}
