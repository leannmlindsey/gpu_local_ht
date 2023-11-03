## To Compile on INTEL DEVCLOUD
qsub -I -l nodes=1:gen9:gpu:ppn=2 -d .

icpx -fsycl -I . *.cpp

## To Compile on Perlmutter
module load intel-llvm/2023-WW13

source /pscratch/sd/m/mgawan/syclomatic/install_setup.sh

source /pscratch/sd/m/mgawan/syclomatic/env.sh

c2s --version

which nvcc

clang++ -std=c++17 -fsycl -fsycl-targets=nvptx64-nvidia-cuda -Xsycl-target-backend '--cuda-gpu-arch=sm_80' *.cp
