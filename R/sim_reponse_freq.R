sim_block <- function(lwr_endpt, interval, duration){
  end <- interval - duration
  a <- sample(0:end, 1)
  if(a == 0){
    df <- tribble(
      ~start, ~end, ~type, 
      a, a + duration, "B", 
      a + duration, interval, "A"
    ) 
  } else {
    if(a == end){
      df <- tribble(
        ~start, ~end, ~type, 
        0, a, "A", 
        a , interval, "B"
      )
    } else {
      df <- tribble(
        ~start, ~end, ~type, 
        0, a, "A", 
        a, a + duration, "B", 
        a+duration, interval, "A"
      )
    }
  }
  df <- 
    df %>% 
    mutate(
      start = start + lwr_endpt, 
      end = end + lwr_endpt
    )
  return(df)
}
#' sim_response_freq
#'
#' @param interval
#'
#' @return
#' @export
#'
#' @examples
sim_response_freq <- function(interval = 3, ID = 1) {
  start_points <- seq(0, 3600, interval)
  simDB <- 
    start_points %>%  
    map_df(~sim_block(.x, interval = 3, duration = 1))
  simDB <- 
    simDB %>% 
    add_column(ID = ID)
  return(simDB)
}


pacman::p_load(tidyverse, targets)
simDB <- sim_response_freq(300)
source("R/plot_simDB.R")
plot_simDB(simDB)
