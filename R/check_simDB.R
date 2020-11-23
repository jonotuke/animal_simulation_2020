#' check_simDB
#'
#' @param simDB
#'
#' @return
#' @export
#'
#' @examples
check_ID <- function(simDB) {
  simDB
  # Check starts at zero
  start <- min(simDB$start)
  # Check ends at one
  end <- max(simDB$end)
  # Check lie between one and 3600
  if(all(
    between(simDB$start, 0, 3600),
    between(simDB$end, 0, 3600)
  )){
    in_range <- "YES"
  } else {
    in_range <- "NO"
  }
  # Check no missing
  simDB <- 
    simDB %>% 
    mutate(
      next_start = lead(start), 
      diff = end - next_start
    )
  if(any(simDB$diff > 0, na.rm = TRUE)){
    overlap <- "YES"
  } else {
    overlap <- "NO"
  }
  if(any(simDB$diff < 0, na.rm = TRUE)){
    missing <- "YES"
  } else {
    missing <- "NO"
  }
  # Check overlapping
  report <- tibble(
    ID = simDB$ID[1],
    start = start, 
    end = end, 
    in_range = in_range, 
    overlap = overlap, 
    missing = missing
  )
  return(report)
}

check_simDB <- function(simDB){
  results <- simDB %>% group_split(ID) %>% 
    map_df(check_ID)
  return(results)
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# example_simDB
# check_simDB(example_simDB)
# # Break start
# example_simDB$start[1] <- 360
# check_simDB(example_simDB)
# # Break END
# tar_load(example_simDB)
# example_simDB$end[4] <- 3240
# check_simDB(example_simDB)
# # Break range
# tar_load(example_simDB)
# example_simDB$start[1] <- -360
# example_simDB$end[8] <- 3960
# check_simDB(example_simDB)
# # Make overlap
# tar_load(example_simDB)
# example_simDB$start[2] <- 180
# example_simDB$end[6] <- 1620
# example_simDB
# plot_simDB(example_simDB)
# check_simDB(example_simDB)
# # Make missing
# tar_load(example_simDB)
# example_simDB$start[2] <- 540
# example_simDB$end[6] <- 1260
# example_simDB
# plot_simDB(example_simDB)
# check_simDB(example_simDB)
