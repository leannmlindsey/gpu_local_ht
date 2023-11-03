## To Compile on INTEL DEVCLOUD
qsub -I -l nodes=1:gen9:gpu:ppn=2 -d .
icpx -fsycl -I . *.cpp

## To Compile on Perlmutter
module load intel-llvm/2023-WW13
source /pscratch/sd/m/mgawan/syclomatic/install_setup.sh
source /pscratch/sd/m/mgawan/syclomatic/env.sh
c2s --version
dpct version 18.0.0. Codebase:(fec0b02f4057b7fa5b9e772e8725962be1b9b602)

which nvcc
/pscratch/sd/m/mgawan/syclomatic/cuda_local/11.7/bin/nvcc

clang++ -std=c++17 -fsycl -fsycl-targets=nvptx64-nvidia-cuda -Xsycl-target-backend '--cuda-gpu-arch=sm_80' *.cp
