#' pin_point_sampling
#'
#' @param simDB 
#' @param start_pt
#' @param interval
#'
#' @return sample_DB
#' @export
#'
#' @examples
pin_point_sampling <- function(start_pt = 0, interval, duration = 1) {
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
# pin_point_sampling(interval = 3)