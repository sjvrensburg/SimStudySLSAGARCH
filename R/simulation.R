#' Estimate Scenario
#'
#' Reads simulated data for a scenario and fits the
#' SLS-AGARCH(1, 1) model to each realisation. Returns
#' a data frame suitable for use with `rsimsum`
#'
#' @param spec model specification
#' @param se_type type of standard errors, default is "QLIKE"
#' @param tiktak boolean indicating whether to use `SLSAGARCH::tiktak`
#' @param tiktak_opts list of options to pass to `SLSAGARCH::tiktak`
#' @param strategy strategy for parallel execution, default is "multisession"
#' @param scenario scenario identifier.
#' @param ... additional parameters to pass to `fit_many`
#'
#' @return A dataframe
#' @export
estimate_scenario <- function(
    spec = SLSAGARCH::specification(type = "S"),
    se_type = "QMLE", tiktak = TRUE,
    tiktak_opts = list(
      n = 250L, N = 10L, thin = 5L,
      reltol = 1e-03,
      lead_solver_opts = SLSAGARCH::nloptr_slsqp_options(maxtime = 0.35),
      lag_solver_opts = SLSAGARCH::nloptr_slsqp_options(maxtime = 0.35 / 2),
      a = 2, b = 2.5, m = 25L, verbose = FALSE),
    strategy = "multisession", scenario = 1L, ...) {
  # Get the simulated data
  obs <- scenario_files(
    path = sprintf("scenario_%02d.fst", scenario)) |>
    fst::read.fst()
  obs <- split.data.frame(obs, f = obs$n)
  # Convert to matrices for use with `fit_many`
  obs <- lapply(obs, function(x) {
    as.matrix(x[, -1 * 1:3])
  })

  # Messages
  message(sprintf("Scenario %02d\n", scenario))
  message(sprintf("Started: %s", format(Sys.time(), "%d %b %Y, %H:%M")))

  # Get the parameters
  data("parameters")

  # Estimate the models
  ests <- foreach::foreach(i = 1:length(obs), .combine = "bind_rows") %do% {
    mat <- obs[[i]]
    message(sprintf("\tStarting %d/%d\t--\t%s", i, length(obs),
                    format(Sys.time(), "%d %b %Y, %H:%M")))
    res <- fit_many(spec, param = as.vector(parameters[scenario, ]),
                    ymat = mat, se_type = se_type,
                    tiktak = tiktak, tiktak_opts = tiktak_opts,
                    strategy = strategy, ...)
    message(sprintf("\tCompleted %d/%d\t--\t%s", i, length(obs),
                    format(Sys.time(), "%d %b %Y, %H:%M")))
    res
  }
  ests$true <- ests$true |> unlist()
  ests <- ests |>
    dplyr::as_tibble() |>
    dplyr::mutate(
      Simulation = as.factor(Simulation),
      par = as.factor(par)) |>
    dplyr::rename(
      "Estimate" = "est", "Parameter" = "par",
      "True" = "true", "SE" = "se") |>
    as.data.frame()
  gc()
  message(sprintf("Completed: %s", format(Sys.time(), "%d %b %Y, %H:%M")))

  ests
}
