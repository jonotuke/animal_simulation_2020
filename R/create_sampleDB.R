#' create_sampleDB
#'
#' @param 
#'
#' @return
#' @export
#'
#' @examples
create_sampleDB <- function() {
  sampleDB <-
    tribble(
      ~start, ~end,
      0, 1440,
      1800, 2520
    )
  return(sampleDB)
}
# pacman::p_load(tidyverse, targets)
# create_sampleDB()