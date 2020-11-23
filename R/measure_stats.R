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
    mutate(
      duration = end - start
    ) %>% 
    group_by(ID, type) %>% 
    summarise(
      n = n(), 
      duration = sum(duration), 
      avg_duration = duration / n
    ) %>% 
    mutate(
      N = sum(n), 
      total = sum(duration),
      p_behaviour = n / N, 
      p_time = duration / total
    )
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# measure_stats(example_simDB)