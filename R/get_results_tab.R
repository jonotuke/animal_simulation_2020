#' get_results_tab
#'
#' @param sims_gold_samples
#'
#' @return
#' @export
#'
#' @examples
get_results_tab <- function(sims_gold_samples) {
  sims_gold_samples %>% 
    unnest(c(true_p, samples)) %>% 
    mutate(
      error = p - true_p
    ) %>% 
    group_by(
      methods, params, method, delta, true_p
    ) %>% 
    summarise(
      m = mean(error), 
      lwr = quantile(error, 0.025),
      upr = quantile(error, 0.975), 
      .groups = "keep"
    ) 
}
# pacman::p_load(tidyverse, targets)
# tar_load(sims_gold_samples)
# get_results_tab(sims_gold_samples)