#' plot_sampling
#'
#' @param simDB original simulation
#' @param sampling sampled data
#'
#' @return
#' @export
#'
#' @examples
plot_sampling <- function(simDB, sampling, sampleDB) {
  width = 0.1
  plot_simDB(simDB) + 
    geom_rect(aes(xmax = end, xmin = start, 
                  ymin = ID - 0.5 - width,
                  ymax = ID -0.5 +  width, 
                  fill = type,
                  ), col = "black", alpha = 0.5, data = sampling) + 
    geom_point(aes(x = start, y = 0), data = sampleDB) + 
    geom_point(aes(x = end, y = 0), data = sampleDB) + 
    geom_segment(aes(x = start, xend = end, y = 0, yend = 0), data = sampleDB)
}
# pacman::p_load(tidyverse, targets)
# source("R/plot_simDB.R")
# tar_load(example_simDB)
# tar_load(example_sampling)
# tar_load(example_sampleDB)
# plot_sampling(example_simDB, example_sampling, example_sampleDB)