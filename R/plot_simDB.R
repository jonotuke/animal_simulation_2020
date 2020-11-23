#' plot_sim
#'
#' @param sim_df
#'
#' @return ggplot
#' @export
#'
#' @examples
plot_simDB <- function(sim_df, width = 0.1) {
  IDs <- unique(sim_df$ID)
  sim_df %>% 
    ggplot(aes()) + 
    geom_rect(aes(xmin = start, 
                  ymin = ID - width, 
                  fill = type,
                  xmax = end, 
                  ymax = ID + width), col = "black", alpha = 0.5) + 
    labs(x = "Time", fill = "Behaviour", y = "ID") + 
    scale_y_continuous(breaks = IDs) + 
    scale_x_continuous(breaks = seq(0, 3600, 360))
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# plot_simDB(example_simDB)
