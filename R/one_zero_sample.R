#' one_zero sampling
#'
#' @param simDB 
#' @param start_pt
#' @param interval
#' @param duration
#'
#' @return sample_DB
#' @export
#'
#' @examples
one_zero_sampling <- function(start_pt = 0, interval, duration = 1) {
  df <- tibble(
    start = start_pt + 0:5000 * interval,
    end = start + duration
  )
  df <- 
    df %>% 
    filter(end <= 3600)
  return(df)
}
# pacman::p_load(tidyverse, targets)
# one_zero_sampling(interval = 10, duration = 2)
