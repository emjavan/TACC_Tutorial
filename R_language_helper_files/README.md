## README: Setting Up Custom R Library Path on TACC

### Get on an interactive session
```
idev -N 1 -n 1 -t 02:00:00 -p development
```

### Load Rstats module (built-in TACC version of R)
```
module load Rstats
```

### Find your home directory path
Run this to see your home directory path, replacing the example with your actual path:
```
pwd
```

### Start an R session
```
R
```

### Check current library paths
```
.libPaths()
```

If you do not see a personal library path and only TACC's, you need to add one.

### Temporarily add a new library path for this session
```
.libPaths(c("/YOUR/CUSTOM/PATH/R", .libPaths()))
quit()
```

However, this change is only for the current session. To make it permanent, follow one of the options below:

## Modify `.Rprofile`
Open (or create) `~/.Rprofile` and add .libPaths(c("~/R/", .libPaths())):
```
vi ~/.Rprofile 
i
.libPaths(c("~/R/", .libPaths()))

```
Restart R and check by downloading some packages you need:
```
R
file.exists("~/.Rprofile")
.libPaths()
install.packages("pacman")  # Pick any mirror, usually one in the US
library(pacman)
quit()
```

Double-check that the package exists by listing your custom R library path:
```
ls /YOUR/CUSTOM/PATH/R
```

## Exit the Interactive Session
If you're done, type:
```
exit
```

