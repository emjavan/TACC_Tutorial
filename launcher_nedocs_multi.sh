#!/bin/bash

#SBATCH -J nedocs_hourly                      # Job name
#SBATCH -o nedocs_hourly.%j.o                 # Name of stdout output file (%j expands to jobId)
#SBATCH -e nedocs_hourly.%j.e                 # Name of stdout output file (%j expands to jobId)
#SBATCH -p normal                             # Queue name, small is for <=2 nodes, normal for 3+ nodes
#SBATCH -N 1                   	              # Total number of nodes requested (24 cores/node)
#SBATCH -n 10                                 # Total number of tasks to run
#SBATCH -t 02:00:00            	              # Run time (hh:mm:ss)
#SBATCH -A XXXXXXXX                           # Allocation name
#SBATCH --mail-user=druthipalle@utexas.edu    # Email for notifications
#SBATCH --mail-type=all                       # Type of notifications, begin, end, fail, all

# Load R module
module load Rstats

# Load launcher
module load launcher

# Configure launcher
EXECUTABLE=$TACC_LAUNCHER_DIR/init_launcher
PRUN=$TACC_LAUNCHER_DIR/paramrun
CONTROL_FILE=commands_nedocs_multi.txt
export LAUNCHER_JOB_FILE=commands_nedocs_multi.txt
export LAUNCHER_WORKDIR=`pwd`
export LAUNCHER_SCHED=interleaved

# Start launcher
$PRUN $EXECUTABLE $CONTROL_FILE