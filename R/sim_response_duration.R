#' simulate response duration
#' 
#' Splits time into blocks and then choose one of the seconds in that block for the behaviour. 
#'
#' @param interval rate of event, i.e., every 3 seconds set interval to 3. 
#'
#' @return simDB
#' @export
#'
#' @examples
sim_response_duration <- function(duration){
  starts <- seq(1, 3600, 600)
  ends <- seq(600, 3600, 600)  - duration
  df <- tibble(
    time = 1:3600, 
    type = "background"
  )
  for(i in 1:length(starts)){
    from <- sample(starts[i]:ends[i], size = 1)
    to <- from + duration - 1
    df$type[from:to] <- "event"
  }
  return(df)
}

# pacman::p_load(tidyverse)
# source("R/plot_simDB.R")
# plot_simDB(sim_response_duration(300)) + 
#   geom_vline(xintercept = seq(1, 3600, 600))

