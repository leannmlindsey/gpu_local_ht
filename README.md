## To Clone and Checkout Hip Branch
git clone https://github.com/leannmlindsey/gpu_local_ht.git

cd gpu_local_ht

git checkout hip

git status

**verify you are on the hip branch**



## To Compile on Notchpeak 366 (AMD MI100)
salloc --time=1:00:00 --account=eval --partition=notchpeak-eval --gres=gpu
module load rocm
rocm-smi 

**verify that you have an AMD GPU**

cd src

mkdir build

./test_script.sh // compiles and runs a test run, reports if tests pass or fail

## GUNZIP the larger files
cd gpu_local_ht/locassm_data

gunzip *.gz

## To Run Benchmarking Tests
cd gpu_local_ht/src

./test_script.sh #Run one test on four datasets, this run compiles the code and reports if the tests pass or fail

./test_all.sh #Runs test_script.sh ten times and takes the average

./test_script_large.sh #Run one test on four large datasets 

./test_all_large.sh #Runs test_script_large.sh and takes the average
