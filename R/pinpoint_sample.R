#' pin_point_sampling
#'
#' @param interval
#'
#' @return points
#' @export
#'
#' @examples
pin_point_sampling <- function(interval) {
  pts <- seq(1, 3600, interval)
  return(pts)
}
# pacman::p_load(tidyverse, targets)
# pin_point_sampling(interval = 3)
