# TACC Tutorial
Quick examples for running jobs on TACC in serial or parallel. Examples are for Frontera, but are nearly identical for all clusters. If you'd like to get deeper into everything I highly recommend the [Software Engineering and Design](https://coe-332-sp22.readthedocs.io/en/main/index.html) course.

## 1. Login via ssh
* On Mac open Terminal. Application > Utilities > Terminal
* You need to choose TFA option in your TACC user portal. I find downloading the app faster and more secure than using text messaging.
~~~~
ssh example_user@frontera.tacc.utexas.edu
enter password
enter code for 2-factor authentication
~~~~

## 2. Clone/fork this repository or make one
* Once connected to TACC you are on a login node. Login nodes are a shared resource with other users. Do **NOT** run or do anything that requires computation/resources. You can copy things to Corral (long-term storage), but other jobs must be done on a compute node.
* cdw = change directory to $WORK, same as cd $WORK. TACC has 3 main directory $HOME, $WORK, $SCRATCH 
* You will need to become familiar with Linux and BASH to work efficiently in a high performance computing (HPC) environment
~~~~
git clone https://github.com/emjavan/TACC_Tutorial.git
~~~~

* Example of initializing a git repo and pushing 
~~~~
mkdir practice_repo
cd practice_repo
git init
time for iter in {1..10}; do echo $iter; done >> test_loop.txt 
git status
git add test_loop.txt
git commit -m "first commit, created test_loop.txt"
git push
git status
~~~~
* If you make changes elsewhere and need to sync this repository. I recommend pulling before you start to work or be sure you've change to a working/test branch. Marge conflicts are very annoying and a time sink.
~~~~
git pull
~~~~

## 3. Pick an editor
* vi, vim, emacs. You'll need to become comfortable with some editor to make changes to files and debug

## 4. Request compute node
* To test out some code quickly you'll want a development node, the max time is 2hrs. Replace Example_Allocation with the name of the allocation you've been added to. If you want to end a session before you get kicked off, then type `exit`.
~~~~
idev -N 1 -n 1 -t 02:00:00 -p development -A Example_Allocation
do some stuff
exit
~~~~
* If you need more time and don't want to submit a job you will have to wait in the queue live and risk your internet connection being broken and disrupting your work.
~~~~
idev -N 1 -n 1 -t 6:00:00 -p small -A Example_Allocation
~~~~
* If you have a very large job you may wish to avoid multiple tasks being performed on one node and/or need a high memory node. nvdimm is more expensive than normal and small queues, so do not use until testing the limits of your code.
~~~~
idev -N 1 -ntasks-per-node 1 -t 02:00:00 -p nvdimm -A Example_Allocation
~~~~

## 4. Submit a serial job
* Submit your job
~~~~
sbatch my_serial_job.sh
~~~~
* Check on your job online at the TACC portal or showq = show queue
* If you need to terminate a job use scancel and the JOBID listed from showq
~~~~
showq -u
scancel JOBID
~~~~

## 5. Submit a parallel job
* Always good to test if the first line of your commands file runs appropriately in an interactive session
* Use time to estimate run time and ensure you have requested enough to complete all tasks
~~~~
sbatch launch_parallel_job.sh
~~~~