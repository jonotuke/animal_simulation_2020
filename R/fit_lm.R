#' fit_LM
#'
#' @param sims_gold_samples
#'
#' @return
#' @export
#'
#' @examples
fit_LM <- function(sims_gold_samples, sim_method) {
    df <- sims_gold_samples %>% 
      unnest(c(true_p, samples)) %>% 
    mutate(
      error = p - true_p, 
      params = factor(params), 
      delta = factor(delta)
    ) %>% 
    filter(methods == sim_method)
  print(df)
  sims_lm <- lm(error ~ params * method * delta, data = df)
  return(sims_lm)
}
# pacman::p_load(tidyverse, targets, gglm)
# tar_load(sims_gold_samples)
# sims_lm <- fit_LM(sims_gold_samples, sim_method = "RF")
# sims_lm
# gglm(sims_lm)