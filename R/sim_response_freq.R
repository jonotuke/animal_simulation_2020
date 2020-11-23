#' simulate response frequency
#' 
#' Splits time into blocks and then choose one of the seconds in that block for the behaviour. 
#'
#' @param interval rate of event, i.e., every 3 seconds set interval to 3. 
#'
#' @return simDB
#' @export
#'
#' @examples
sim_response_freq <- function(interval){
  df <- tibble(
    time = 1:3600, 
    type = "background"
  )
  ## Add blocks
  blocks <- rep(1:1200, each = interval)
  blocks <- blocks[1:3600]
  df <- df %>% 
    add_column(
      block = blocks
    )
  i <- df %>% 
    group_by(block) %>% 
    sample_n(1) %>% 
    pull(time)
  df$type[i] <- "event"
  df <- 
    df %>% select(-block)
  return(df)
}

# plot_simDB(sim_response_freq(300))

