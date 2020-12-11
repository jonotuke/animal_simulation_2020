#' get_results_plot
#'
#' @param results_tab
#'
#' @return
#' @export
#'
#' @examples
get_results_plot <- function(results_tab, sim_method) {
  results_tab %>% 
    filter(methods == sim_method) %>% 
    ggplot(aes(factor(delta), m, col = method)) + 
    geom_point() + 
    geom_errorbar(aes(ymin = lwr, ymax = upr), width = 0.3) + 
    facet_wrap(~params)
}
# pacman::p_load(tidyverse, targets)
# tar_load(results_tab)
# results_tab
# get_results_plot(results_tab, "RD")
# get_results_plot(results_tab, "RF")
