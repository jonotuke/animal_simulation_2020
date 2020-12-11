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
one_zero_sampling <- function(simDB, delta) {
  n <- nrow(simDB)
  k <- ceiling(n / delta)
  blocks <- rep(1:k, each = delta)
  blocks <- blocks[1:n]
  simDB <- simDB %>% 
    add_column(
      block = blocks
    )
  sample <- simDB %>% 
    group_by(block) %>% 
    summarise(
      y = ifelse(any(type == "event"), 1, 0), 
      .groups = "keep"
    ) 
  p <- mean(sample$y)
  return(
    tibble(
      method = "01", delta = delta, p = p
    )
  )
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# example_simDB <- example_simDB %>% filter(time < 3600)
# one_zero_sampling(example_simDB, 3)

