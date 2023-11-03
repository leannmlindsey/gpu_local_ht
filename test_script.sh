#!/bin/bash

rm sorted*
rm screen*
rm out_file*

file_21="localassm_extend_7-21.dat"
file_33="localassm_extend_1-33.dat"
file_55="localassm_extend_7-55.dat"
file_77="localassm_extend_9-77.dat"
kmer_sizes=(21 33 55 77)
i=0
test_number=$1
kmer_size=${kmer_sizes[$i]}
for curr_file in $file_21 $file_33 $file_55 $file_77
do 
	echo "************************************"
	echo "Running test for Kmer size: $kmer_size"
	echo "Running test on $data_dir/$curr_file"
	./a.out ./locassm_data/$curr_file $kmer_size out_file_$kmer_size.dat > screen_$kmer_size
	#echo "./a.out ./locassm_data/$curr_file $kmer_size out_file_$kmer_size.dat > screen_$kmer_size"
	benchmark_time=$(tail -n 1 screen_$kmer_size)
        echo "time for $kmer_size on test number $test_number: $benchmark_time" 
	sort out_file_$kmer_size.dat >> sorted_new
	sort ./locassm_data/"res_$curr_file" >> sorted_res
	difference=$(diff sorted_new sorted_res)

	echo "Number of differences in $kmer_size"
	diff sorted_new sorted_res | grep '>' | wc -l
	#echo "Differences in $kmer_size"
	#diff sorted_new sorted_res
	echo "************************************"
	if [ -z "$difference" ];
	then 
		echo "Test for Kmer size: $kmer_size PASSED!"
	else
		echo "Test for Kmer size: $kmer_size FAILED!"
	fi

	((i=i+1))
	kmer_size=${kmer_sizes[$i]}
done
