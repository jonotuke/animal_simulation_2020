#' add_gold
#'
#' @param sims
#'
#' @return
#' @export
#'
#' @examples
add_gold <- function(sims) {
  sims %>% mutate(
    true_p = map(data, get_prop)
  )
}
# source("R/get_prop.R")
# pacman::p_load(tidyverse, targets)
# tar_load(sims)
# add_gold(sims) %>% unnest(p)