#!/bin/bash

#SBATCH -J test_job_par              # Job name
#SBATCH -o ptest_job_par.%j.o        # Name of stdout output file (%j expands to jobId)
#SBATCH -e test_job_par.%j.e         # Name of stdout output file (%j expands to jobId)
#SBATCH -p normal                    # Queue name, small is for <=2 nodes, normal for 3+ nodes
#SBATCH -N 3                   	     # Total number of nodes requested (24 cores/node)
#SBATCH -n 9                         # Total number of tasks to run
#SBATCH -t 00:30:00            	     # Run time (hh:mm:ss)
#SBATCH -A Example_Allocation        # Allocation name
#SBATCH --mail-user=example_email    # Email for notifications
#SBATCH --mail-type=all              # Type of notifications, begin, end, fail, all

# Create command script
# Note: bash indent is 3 space not a tab, so ensure your editor does not auto indent tabs
# >> add to new line in file, while > will replace
for i in {1..3}; do
	for j in {1..3}; do
		echo bash run_test_job_par.sh $i $j >> commands_test_job_par.txt
	done
done

# make folder if it doesn't exist
mkdir -p parallel_output_files

# Load launcher
module load launcher

# Configure launcher
EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
PRUN=$TACC_LAUNCHER_DIR/paramrun
CONTROL_FILE=commands_test_job_par.txt
export LAUNCHER_JOB_FILE=commands_test_job_par.txt
export LAUNCHER_WORKDIR=`pwd`
export LAUNCHER_SCHED=interleaved

# Start launcher
$PRUN $EXECUTABLE $CONTROL_FILE
