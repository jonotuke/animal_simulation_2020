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
one_zero_sampling <- function(interval, duration = 1) {
  n_blocks <- 3600 / interval
  pts <- rep(seq(1, 3600, interval), each = duration) 
  increments <- rep(0:(duration - 1), n_blocks)
  pts <- pts + increments
  return(pts)
}
# pacman::p_load(tidyverse, targets)
# one_zero_sampling(interval = 3, duration = 2)


