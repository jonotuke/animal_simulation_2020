#' Friedman_test
#'
#' @param tar_load(sims_gold_samples)
#'
#' @return
#' @export
#'
#' @examples
perform_test <- function(sims_gold_samples, method = "RD") {
  block_data <- sims_gold_samples %>% 
    filter(methods == method) %>%
    unnest(c(true_p, samples)) %>% 
    mutate(
      error = p - true_p
    ) %>% 
    unite(
      col = "block", 
      c(methods, params, ID, delta)
    )
  results1 <- block_data %>% 
    friedman_test(error ~ method | block) %>% 
    select(statistic, df, p)
  results2 <- block_data %>% 
    friedman_effsize(error ~ method | block) %>% 
    select(effsize, method, magnitude)
  bind_cols(results1, results2)
}
# pacman::p_load(tidyverse, targets, rstatix)
# tar_load(sims_gold_samples)
# perform_test(sims_gold_samples, "RD")
# perform_test(sims_gold_samples, "RF")