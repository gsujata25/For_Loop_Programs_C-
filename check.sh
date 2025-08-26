#!/bin/bash
pass=true
total_tests=15
passed_tests=0
failed_tests=0

normalize() {
    echo "$1" | tr -s ' ' | sed 's/[[:space:]]*$//'
}

# =============================
# Test printevennum.cpp
# =============================
g++ -o printevennum printevennum.cpp
if [ $? -ne 0 ]; then
    echo "printevennum.cpp failed to compile"
    pass=false
    failed_tests=$((failed_tests+3))
else
    # Test case 1
    output=$(echo "2 10" | ./printevennum)
    expected_output="Even numbers between 2 and 10 are:
2 4 6 8 10"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printevennum.cpp test (2 to 10) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printevennum.cpp test (2 to 10) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 2
    output=$(echo "3 9" | ./printevennum)
    expected_output="Even numbers between 3 and 9 are:
4 6 8"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printevennum.cpp test (3 to 9) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printevennum.cpp test (3 to 9) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 3
    output=$(echo "7 7" | ./printevennum)
    expected_output="Even numbers between 7 and 7 are:"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printevennum.cpp test (7 to 7) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printevennum.cpp test (7 to 7) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi
fi

# =============================
# Test sumevenodd.cpp
# =============================
g++ -o sumevenodd sumevenodd.cpp
if [ $? -ne 0 ]; then
    echo "sumevenodd.cpp failed to compile"
    pass=false
    failed_tests=$((failed_tests+3))
else
    # Test case 1
    output=$(echo "5 2 3 4 5 6" | ./sumevenodd)
    if echo "$output" | grep -q "12" && echo "$output" | grep -q "8"; then
        echo "sumevenodd.cpp test (mixed input) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "sumevenodd.cpp test (mixed input) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 2
    output=$(echo "4 2 4 6 8" | ./sumevenodd)
    if echo "$output" | grep -q "20" && echo "$output" | grep -q "0"; then
        echo "sumevenodd.cpp test (all even) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "sumevenodd.cpp test (all even) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 3
    output=$(echo "3 1 3 5" | ./sumevenodd)
    if echo "$output" | grep -q "0" && echo "$output" | grep -q "9"; then
        echo "sumevenodd.cpp test (all odd) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "sumevenodd.cpp test (all odd) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi
fi

# =============================
# Test average.cpp
# =============================
g++ -o average average.cpp
if [ $? -ne 0 ]; then
    echo "average.cpp failed to compile"
    pass=false
    failed_tests=$((failed_tests+3))
else
    # Test case 1
    output=$(echo "3 10 20 30" | ./average)
    if echo "$output" | grep -q "20"; then
        echo "average.cpp test (10 20 30) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "average.cpp test (10 20 30) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 2
    output=$(echo "2 5 15" | ./average)
    if echo "$output" | grep -q "10"; then
        echo "average.cpp test (5 15) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "average.cpp test (5 15) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 3
    output=$(echo "4 1 2 3 4" | ./average)
    if echo "$output" | grep -q "2.5"; then
        echo "average.cpp test (1 2 3 4) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "average.cpp test (1 2 3 4) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi
fi

# =============================
# Test printhalfpyramid.cpp
# =============================
g++ -o printhalfpyramid printhalfpyramid.cpp
if [ $? -ne 0 ]; then
    echo "printhalfpyramid.cpp failed to compile"
    pass=false
    failed_tests=$((failed_tests+3))
else
    # Test case 1
    output=$(echo "3" | ./printhalfpyramid)
    expected_output="*
* *
* * *"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramid.cpp test (rows=3) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramid.cpp test (rows=3) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 2
    output=$(echo "1" | ./printhalfpyramid)
    expected_output="*"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramid.cpp test (rows=1) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramid.cpp test (rows=1) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 3
    output=$(echo "5" | ./printhalfpyramid)
    expected_output="*
* *
* * *
* * * *
* * * * *"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramid.cpp test (rows=5) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramid.cpp test (rows=5) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi
fi

# =============================
# Test printhalfpyramidnum.cpp
# =============================
g++ -o printhalfpyramidnum printhalfpyramidnum.cpp
if [ $? -ne 0 ]; then
    echo "printhalfpyramidnum.cpp failed to compile"
    pass=false
    failed_tests=$((failed_tests+3))
else
    # Test case 1
    output=$(echo "4" | ./printhalfpyramidnum)
    expected_output="1
2 3
4 5 6
7 8 9 10"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramidnum.cpp test (rows=4) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramidnum.cpp test (rows=4) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 2
    output=$(echo "2" | ./printhalfpyramidnum)
    expected_output="1
2 3"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramidnum.cpp test (rows=2) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramidnum.cpp test (rows=2) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi

    # Test case 3
    output=$(echo "5" | ./printhalfpyramidnum)
    expected_output="1
2 3
4 5 6
7 8 9 10
11 12 13 14 15"
    if [ "$(normalize "$output")" = "$(normalize "$expected_output")" ]; then
        echo "printhalfpyramidnum.cpp test (rows=5) passed"
        passed_tests=$((passed_tests+1))
    else
        echo "printhalfpyramidnum.cpp test (rows=5) failed"
        pass=false
        failed_tests=$((failed_tests+1))
    fi
fi

# =============================
# Final summary
# =============================
if [ "$pass" = true ]; then
    echo "All tests passed! ($passed_tests/$total_tests)"
else
    echo "$passed_tests tests passed, $failed_tests tests failed."
fi
