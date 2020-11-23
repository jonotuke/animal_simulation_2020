#' plot_sim
#'
#' @param sim_df
#'
#' @return ggplot
#' @export
#'
#' @examples
plot_simDB <- function(sim_df) {
  sim_df %>% 
    filter(type == "event") %>% 
    ggplot(aes(time, "event")) + geom_point(shape = "square") + 
    scale_x_continuous(breaks = seq(0, 3600, 300)) + 
    labs(y = NULL)
}

# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# plot_simDB(example_simDB)
