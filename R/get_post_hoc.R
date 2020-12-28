#' Get_post_hoc
#'
#' @param sims_gold_samples
#'
#' @return
#' @export
#'
#' @examples
get_post_hoc <- function(sims_gold_samples) {
  sims_gold_samples %>% 
    unnest(c(true_p, samples)) %>% 
    mutate(
      error = p - true_p
    ) %>% 
    group_by(methods, params, delta) %>% 
    wilcox_test(error ~ method, paired = TRUE, p.adjust.method = 'fdr')
}
# pacman::p_load(tidyverse, targets)
# tar_load(sims_gold_samples)
# get_post_hoc(sims_gold_samples)