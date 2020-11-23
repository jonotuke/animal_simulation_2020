#' plot_sampling
#'
#' @param simDB original simulation
#' @param sampling sampled data
#'
#' @return
#' @export
#'
#' @examples
plot_sampling <- function(simDB, sampling, points) {
  sampleDB <- tibble(time = points)
  simDB %>% 
    filter(type == "event") %>% 
    ggplot(aes(time, "gold standard")) + 
    geom_point(shape = "square") + 
    geom_point(aes(x = time, "sample points"), data = sampleDB) + 
    geom_point(aes(y = "sample"), data = sampling %>% filter(type == "event")) + 
    scale_x_continuous(breaks = seq(0, 3600, 300)) + 
    labs(y = NULL)
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# pts <- pin_point_sampling(300)
# example_sample <- sample_simDB(simDB = example_simDB, pts = pts)
# plot_sampling(example_simDB, example_sample, pts)
