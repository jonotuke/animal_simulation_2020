#' Sim_protocol
#'
#' @param params
#' @param n_sims
#'
#' @return
#' @export
#'
#' @examples
create_sim_protocol <- function(params, n_sims) {
  crossing(methods = c("RF", "RD"), params = params, ID = 1:n_sims)
}
# pacman::p_load(tidyverse, targets)
# create_sim_protocol(params = c(3, 30, 300), n_sims = 2)