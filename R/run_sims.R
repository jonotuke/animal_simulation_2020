run_sim <- function(methods, params){
  if(methods == "RD"){
    df <- sim_response_duration(duration = params)
  } else {
    df <- sim_response_freq(interval = params)
  }
  return(df)
}
# run_sim("RD", 3)
#' run_sims
#'
#' @param sim_protocol
#'
#' @return
#' @export
#'
#' @examples
run_sims <- function(sim_protocol) {
  sims <- sim_protocol %>%
    rowwise(methods, params, ID) %>% 
    summarise(run_sim(methods, params)) %>%
    group_by(methods, params, ID) %>% 
    nest()
  sims
}
# pacman::p_load(tidyverse, targets)
# tar_load(sim_protocol)
# run_sims(sim_protocol)
# sims
# plot_simDB(sims$data[[1]])
# plot_simDB(sims$data[[7]])

