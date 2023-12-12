## To Compile on INTEL DEVCLOUD
git clone https://github.com/leannmlindsey/gpu_local_ht.git

cd gpu_local_ht

qsub -I -l nodes=1:gen9:gpu:ppn=2 -d .

icpx -fsycl -I . *.cpp -o ht_loc

## To Compile on Perlmutter
git clone https://github.com/leannmlindsey/gpu_local_ht.git

cd gpu_local_ht

#switch to perlmutter branch

git fetch

git checkout perlmutter

module load intel-llvm/2023-WW13

source /pscratch/sd/m/mgawan/syclomatic/install_setup.sh

source /pscratch/sd/m/mgawan/syclomatic/env.sh

c2s --version

which nvcc

clang++ -std=c++17 -fsycl -fsycl-targets=nvptx64-nvidia-cuda -Xsycl-target-backend '--cuda-gpu-arch=sm_80' *.cp

## GUNZIP the larger files
cd gpu_local_ht/locassm_data
gunzip *.gz

## To Run
cd gpu_local_ht

./test_script.sh #Run one test on four datasets

./test_all.sh #Runs test_script.sh ten times and takes the average

./test_script_large.sh #Run one test on four large datasets 

./test_all_large.sh #Runs test_script_large.sh and takes the average
