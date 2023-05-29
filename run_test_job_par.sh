#!/bin/bash
export BASH_XTRACEFD=1 # redirect echo to stderr
set -x # echo on

# sum our to inputs
num=$(($1 + $2))

# write the sum to a file
echo $num > parallel_output_files/file_${1}_${2}.txt

echo test print file ${1} and ${2}

# each output from a run is going to a new file, we are not trying to write everything to one file
# this is the simplest form of parallelization
