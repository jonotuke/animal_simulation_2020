sample_simDB <- function(simDB, pts){
  simDB <- simDB %>% 
    filter(time %in% pts)
  return(simDB)
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# example_simDB
# sample_simDB(example_simDB, 1700:2000)
