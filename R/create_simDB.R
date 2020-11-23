#' create_simDB
#'
#' @param canvas_raw 
#'
#' @return
#' @export
#'
#' @examples
create_simDB <- function() {
  simDB <- tibble(
    time = 1:3600, 
    type = "background"
  )
  simDB$type[360:1800] <- "event"
  simDB$type[2160:3600] <- "event"
  return(simDB)
}
# pacman::p_load(tidyverse, targets)
# create_simDB()

