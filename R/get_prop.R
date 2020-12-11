#' get_percent
#'
#' @param simDB
#'
#' @return
#' @export
#'
#' @examples
get_prop <- function(simDB) {
  simDB %>% 
    count(type) %>% 
    mutate(N = sum(n)) %>% 
    mutate(p = n / N) %>% 
    filter(type == "event") %>% 
    pull(p)
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# get_percent(example_simDB)

