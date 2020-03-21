#!/usr/bin/env bash


# Test file to help overcome bugs and shortcoming of
# https://github.com/SimonBaeumer/commander version: v2.0.0

source ../util/array.bash

test_array_contains() {
    
    numbers=(1 2 3)
    _util.array.contains $1 numbers
}

test_array_is_array_pass() {
    # pass
    numbers=(1 2 3)
    _util.array.is_array numbers
    
}

test_array_is_array_fail() {
    # pass
    numbers="string"
    _util.array.is_array numbers
    
}


myfunc() {
    local array_reference="$1[@]"
    local test_array=("${!array_reference}")
    echo $test_array
    for __test_element in "${test_array[@]:-}"; do
        echo $__test_element
        
    done
    return 1
}

# numbers=(1 2 3)

# myfunc numbers