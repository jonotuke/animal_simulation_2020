#' sample_interval
#'
#' @param simDB simulation DB
#' @param lwr lower point of interval to sample
#' @param upr upper point of interval to sample
#'
#' @return
#' @export
#'
#' @examples
sample_interval <- function(simDB, lwr, upr) {
  i <- which(simDB$start <= lwr & lwr < simDB$end)
  j <- which(simDB$start < upr & upr <= simDB$end)
  sample <- simDB[i:j, ]
  sample$start[1] <- lwr
  sample$end[nrow(sample)] <- upr
  sample
}
#' Takes a single sim and a sampling data frame
#'
#' @param simDB has a single ID
#' @param sampleDB sampling DB
#'
#' @return
#' @export
#'
#' @examples
sample_singleID <- function(simDB, sampleDB){
  samples <- list()
  for(i in 1:nrow(sampleDB)){
    samples[[i]] <- sample_interval(simDB, sampleDB$start[i], sampleDB$end[i])
  }
  samples <- samples %>% map_df(bind_rows, .id = "sample")
  return(samples)
}
sample_simDB <- function(simDB, sampleDB){
  samples <- simDB %>% group_split(ID) %>% 
    map_df(sample_singleID, sampleDB)
  return(samples)
}
# pacman::p_load(tidyverse, targets)
# tar_load(example_simDB)
# sampleDB <-
#   tribble(
#     ~start, ~end,
#     0.4, 0.4,
#     0.6, 0.6
#   )
# example_simDB
# sample_simDB(example_simDB, sampleDB)