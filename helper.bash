#!/bin/bash

assert_equal() {
    if [ "${1}" != "${2}" ]; then
        echo "${1} != ${2}"
        return 1
    fi
}
