#' create_simDB
#'
#' @param canvas_raw 
#'
#' @return
#' @export
#'
#' @examples
create_simDB <- function() {
  simDB <- tribble(
    ~ID, ~start, ~end, ~type,
    1, 0, 360, "A",
    1, 360, 1800, "B",
    1, 1800, 2160, "C",
    1, 2160, 3600, "A",
    2, 0, 720, "A",
    2, 720, 1440, "C",
    2, 1440, 2520, "A",
    2, 2520, 3600, "B"
  )
  return(simDB)
}
# pacman::p_load(tidyverse, targets)
# create_simDB()