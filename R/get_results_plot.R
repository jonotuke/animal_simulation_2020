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
    ggplot(aes(factor(delta), m, fill = method)) + 
    geom_errorbar(aes(ymin = lwr, ymax = upr, linetype = method), width = 0.3, size = 1, show.legend = FALSE) + 
    geom_point(pch = 21, size = 5) + 
    facet_wrap(~params) + 
    scale_fill_manual(values = c("white", "black")) + 
    labs(y = "Error", 
         x = "Sampling parameters", 
         col = "Sampling method",
         subtitle = "The figures are facetted by simulation parameters"
    ) + 
    theme_classic(base_size = 10) + 
    geom_hline(yintercept = 0) + 
    theme(legend.position = "bottom")
}
# pacman::p_load(tidyverse, targets)
# tar_load(results_tab)
# results_tab
# get_results_plot(results_tab, "RD")
# get_results_plot(results_tab, "RF")
