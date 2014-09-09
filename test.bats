#!/usr/bin/env bats

setup() {
    echo "setup ${BATS_TEST_NAME} ..." >> ./bats.log
}

teardown() {
    echo "teardown ${BATS_TEST_NAME} ..." >> ./bats.log
}

@test "addition using bc" {
    result="$(echo 2 + 2 | bc)"
    
    [ "${result}" -eq 4 ]
}

@test "status code" {
    run ./status.sh
    
    [ "${status}" -eq 0 ]

    run ./status.sh 1
    
    [ "${status}" -eq 1 ]
}

@test "output" {
    run ./output.sh
    
    [ "${output}" = "hogehoge" ]
}

@test "lines" {
    run ./line.sh
    
    [ "${lines[0]}" = "hoge" ]
    [ "${lines[1]}" = "foo" ]
    [ "${lines[2]}" = "bar" ]
}

@test "run command" {
    run bash -c "echo '1,2,3' | awk -F ',' '{ print \$3 }'"
    
    [ "${output}" = "3" ]
}

load helper

@test "load" {
    run ./output.sh

    assert_equal "${output}" "hogehoge"
}

@test "skip" {
    skip "skipped"
}