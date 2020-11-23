## Enough packages to run this file ----
pacman::p_load(tidyverse, targets, tarchetypes)

## Load functions ----
dir("R/", full.names = TRUE) %>% walk(source)

# Set target-specific options such as packages.
tar_option_set(
  packages = c(
    "tidyverse"
  )
)

## Set up plan

tar_pipeline(
  # Example
  tar_target(example_simDB, create_simDB()), 
  # Notes
  tar_render(sim_report, "reports/simulation_notes.Rmd"),
  # simulation
  tar_target(sim_protocol, create_sim_protocol(params = c(3, 30, 300), n_sims = 2)), 
  tar_target(sims, run_sims(sim_protocol))
)
