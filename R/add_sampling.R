#' add_sampling
#'
#' @param sims
#'
#' @return
#' @export
#'
#' @examples
add_sampling <- function(simDB, delta = c(3, 30, 300)) {
  PP <- delta %>% 
    map_df(~pin_point_sampling(simDB, .x))
  one_zero <- delta %>% 
    map_df(~one_zero_sampling(simDB, .x))
  sampling <- bind_rows(PP, one_zero)
  sampling
}
add_sampling_nest <- function(nested_simDB, delta){
  nested_simDB %>%
    mutate(
      samples = map(data, add_sampling, delta = delta)
    ) 
}
# pacman::p_load(tidyverse, targets)
# source("R/pinpoint_sample.R")
# source("R/one_zero_sample.R")
# tar_load(example_simDB)
# tar_load(sims_gold)
# add_sampling(example_simDB, delta = c(6, 60, 600))
# tmp <- add_sampling_nest(sims_gold, delta = c(6, 60, 600))
