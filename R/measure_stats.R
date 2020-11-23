#' measure_stats
#'
#' @param simDB
#'
#' @return
#' @export
#'
#' @examples
measure_stats <- function(simDB) {
  simDB %>% 
    count(type) %>% 
    mutate(
      p = n / sum(n)
    )
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# measure_stats(example_simDB)
