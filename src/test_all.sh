#!/bin/bash

# Loop to run the test 10 times
for i in {1..10}
do
    # Define the output file name
    OUTPUT_FILE="results_test${i}.txt"
    
    echo "Running test $i"
    # Run the script and save the output to the corresponding file
    ./test_script_benchmark.sh > "$OUTPUT_FILE"
    echo "Test $i complete, results stored in $OUTPUT_FILE"
done

echo "All tests completed."

cat results* | grep 'time for 21' | awk '{sum+=$NF} END {print sum/NR}'
cat results* | grep 'time for 33' | awk '{sum+=$NF} END {print sum/NR}'
cat results* | grep 'time for 55' | awk '{sum+=$NF} END {print sum/NR}'
cat results* | grep 'time for 77' | awk '{sum+=$NF} END {print sum/NR}'

mv results* temporary_output_files
