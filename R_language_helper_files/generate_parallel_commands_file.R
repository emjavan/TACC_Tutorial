#///////////////////////////////
#### Generate Commands File ####
#///////////////////////////////
# Pretend you're going to run the R script run_nedocs_timeseries_analysis.R
# It is based on the Synthetic_Inpatient_Data.csv, where RESOURCE is a hospital ID
# We want to run the code for all hospitals, so we'll parallelize that task
#  Our pretend R script actually takes another True/False parameter I'm setting to False for all runs

library(tidyverse)

all_resources_df = read_csv("Synthetic_Inpatient_Data.csv") %>%
  dplyr::select(RESOURCE) %>%
  distinct() 

all_resources_single_command = all_resources_df %>%
  mutate(command_prefix = "time Rscript run_nedocs_timeseries_analysis.R", 
         command_line = paste(command_prefix, RESOURCE, "FALSE")) %>%
  dplyr::select(command_line)

write.table(all_resources_single_command, "commands_nedocs_single.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)


# If we instead wanted to run over all parameter combinations (RESOURCE and T/F)
multi_commands = 
  expand_grid(
    RESOURCE = all_resources_df$RESOURCE, 
    LOGICAL  = c(TRUE, FALSE)
    )

all_resources_multi_command = multi_commands %>%
  mutate(command_prefix = "time Rscript run_nedocs_timeseries_analysis.R", 
         command_line = paste(command_prefix, RESOURCE, LOGICAL))

write.table(all_resources_multi_command, "commands_nedocs_multi.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE)

# In the Launcher script launcher_nedocs_multi.sh you see it calls this commands file
# That is why they are named the same, that is not a requirement
# BUT it's helpful to organize this pair by with having same prefix or suffix








