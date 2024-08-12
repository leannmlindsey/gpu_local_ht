# GPU local assembly kernel for MHM2 on INTEL Hardware
## To Compile on INTEL DEVCLOUD
git clone https://github.com/leannmlindsey/gpu_local_ht.git

cd gpu_local_ht

qsub -I -l nodes=1:gen9:gpu:ppn=2 -d .

icpx -fsycl -I . *.cpp -o ht_loc

## GUNZIP the larger files
cd gpu_local_ht/locassm_data
gunzip *.gz

## To Run
cd gpu_local_ht

./test_script.sh #Run one test on four datasets

./test_all.sh #Runs test_script.sh ten times and takes the average

./test_script_large.sh #Run one test on four large datasets 

./test_all_large.sh #Runs test_script_large.sh and takes the average
