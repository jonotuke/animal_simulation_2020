#' pin_point_sampling
#'
#' @param interval
#'
#' @return points
#' @export
#'
#' @examples
pin_point_sampling <- function(simDB, delta) {
  n <- nrow(simDB)
  k <- floor((n - 1) / delta)
  i <- seq(1, 3600, delta)
  sample <- simDB[i, ]
  p <- sum(sample$type == "event") / length(sample$type)
  return(
    tibble(
      method = "PP", delta = delta, p = p
    )
  )
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# example_simDB
# pin_point_sampling(example_simDB, 3)
