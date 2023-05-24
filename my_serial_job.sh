#!/bin/bash

#SBATCH -J test_job_ser              # Job name
#SBATCH -o ptest_job_ser.%j.o        # Name of stdout output file (%j expands to jobId)
#SBATCH -e test_job_ser.%j.e         # Name of stdout output file (%j expands to jobId)
#SBATCH -p small                     # Queue name, small is for <=2 nodes
#SBATCH -N 1                   	     # Total number of nodes requested (24 cores/node)
#SBATCH -n 1                         # Total number of tasks to run
#SBATCH -t 00:30:00            	     # Run time (hh:mm:ss)
#SBATCH -A Example_Allocation        # Allocation name
#SBATCH --mail-user=example_email    # Email for notifications
#SBATCH --mail-type=all              # Type of notifications, begin, end, fail, all

for i in {1..10}; do
	echo $i >> serial_test.txt
done
