## Enough packages to run this file ----
#install.packages(pacman)
pacman::p_load(tidyverse, targets, tarchetypes)

## Load functions ----
dir("R/", full.names = TRUE) %>% walk(source)

# Set target-specific options such as packages.
tar_option_set(
  packages = c(
    "tidyverse", "rstatix"
  )
)

## Analysis ----
list(
  # Example
  tar_target(example_simDB, create_simDB()),
  # Notes
  tar_render(sim_report, "Notes.Rmd"),
  # simulation
  tar_target(
    sim_protocol,
    create_sim_protocol(
      params = c(3, 30, 300),
      n_sims = 100
    )
  ),
  tar_target(sims, run_sims(sim_protocol)),
  # Add gold standard
  tar_target(sims_gold, add_gold(sims)),
  # Add sampling
  tar_target(
    sims_gold_samples,
    add_sampling_nest(sims_gold, delta = c(5, 50, 500))
  ),
  # Get results
  tar_target(results_tab, get_results_tab(sims_gold_samples)),
  tar_map(
    values = list(sim_method = c("RD", "RF")),
    tar_target(results_plot,get_results_plot(results_tab, sim_method))
  ),
  # Testing
  tar_map(
    values = list(sim_method = c("RD", "RF")),
    tar_target(test_results, perform_test(sims_gold_samples, sim_method))
  ),
  tar_target(post_hoc_tab, get_post_hoc(sims_gold_samples))
)
