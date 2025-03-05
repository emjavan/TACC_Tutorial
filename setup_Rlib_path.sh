# Get on an interactive session
idev -N 1 -n 1 -t 02:00:00 -p development

# Load Rstats module, this is the built in TACC version of R
module load Rstats

# Type pwd to see what YOUR path is to $HOME
# For example, "/home1/06778/emj976/" is mine and needs to be replaced with YOUR DIR!!!
# The numbers here are just another folder. If you're curious cd .. to see who else lives there
pwd

# Start an R session, this would be what it's like to use R before Rstudio existed
R

# Check what are the library paths for R
.libPaths()

# You may notice you have no personal path to write new R packages to just TACC's
# "/opt/apps/intel19/impi19_0/Rstats/4.0.3/lib64/R/library"
# In that case you need to add one, what you name it doesn't matter so much as it's logical
.libPaths(c("/your/custom/path", .libPaths()))

# For example my custom path is just a folder called R inside MY home directory
"/home1/06778/emj976/R/"

# If I were to leave my R session and list what's in my $HOME directory I see a folder called R
ls $HOME

# We are still in our R session at this point unless you quit() and now need to re-open it
# Test out that you can download a needed package from your list, e.g. pacman
install.packages("pacman") # pick any mirror, I usually go with one in US
library(pacman)

# If that's working you can quit() to leave R

# You can double check that package exists by ls your path/to/R/libs
# There should now be a foler for pacman or whatever package you chose to install as a test

# If you're done with the interactive session type exit
