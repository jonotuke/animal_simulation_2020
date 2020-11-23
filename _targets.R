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
  tar_target(example_plot, plot_simDB(example_simDB)),
  tar_target(check_tab, check_simDB(example_simDB)),
  tar_target(example_stat, measure_stats(example_simDB)), 
  tar_target(example_sampleDB, create_sampleDB()), 
  tar_target(example_sampling, sample_simDB(example_simDB, example_sampleDB)),
  tar_target(example_sampling_plot, 
             plot_sampling(example_simDB, example_sampling, example_sampleDB)),
  # tar_target(raw_exercise_data, "data/exercise.xlsx", format = "file"), 
  # Process data
  # tar_target(clean_exercise, get_clean_exercise(raw_exercise_data)), 
  # Get report
  tar_render(sim_report, "reports/simulation_notes.Rmd")
)
