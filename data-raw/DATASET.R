# Specification
sls_sech_spec <- SLSAGARCH::specification(type = "S")
usethis::use_data(sls_sech_spec, overwrite = TRUE)

# Parameters
# We select omega such that hbar = h0 = 1.
parameters <- expand.grid(
  h0 = 1, omega = 1,
  alpha = 0.075, beta = 0.85,
  lambda = c(0, 0.5, 1),
  rho = c(0, 0.25, 0.75)
)
P <- apply(parameters, 1, function(x) {
  SLSAGARCH:::persistence.specification(sls_sech_spec, x)
})
parameters[, 2] <- 1 - P
usethis::use_data(parameters, overwrite = TRUE)

# Datasets
#   These are quite large, so we will store them as fst files.
seed <- 20240127L
R <- 10000
n <- c(250, 500, 750, 1000)

scenario_01 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 1
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_01 |>
  fst::write_fst(path = "inst/extdata/scenario_01.fst",
            compress = 100)
rm(scenario_01)

scenario_02 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 2
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_02 |>
  fst::write_fst(path = "inst/extdata/scenario_02.fst",
            compress = 100)
rm(scenario_02)

scenario_03 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 3
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_03 |>
  fst::write_fst(path = "inst/extdata/scenario_03.fst",
            compress = 100)
rm(scenario_03)

scenario_04 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 4
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_04 |>
  fst::write_fst(path = "inst/extdata/scenario_04.fst",
            compress = 100)
rm(scenario_04)

scenario_05 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 5
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_05 |>
  fst::write_fst(path = "inst/extdata/scenario_05.fst",
            compress = 100)
rm(scenario_05)

scenario_06 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 6
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_06 |>
  fst::write_fst(path = "inst/extdata/scenario_06.fst",
            compress = 100)
rm(scenario_06)

scenario_07 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 7
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_07 |>
  fst::write_fst(path = "inst/extdata/scenario_07.fst",
            compress = 100)
rm(scenario_07)

scenario_08 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 8
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_08 |>
  fst::write_fst(path = "inst/extdata/scenario_08.fst",
            compress = 100)
rm(scenario_08)

scenario_09 <- foreach::foreach(n_i = n, .combine = "rbind") %do% {
  scenario <- 9
  par0 <- unlist(parameters[scenario, ])
  matY <- dgp(spec = sls_sech_spec, param = par0,
              n = n_i, R = R, seed = seed, nthreads = 18L)
  cbind(
    n = n_i,
    lambda = parameters$lambda[scenario],
    rho = parameters$lambda[scenario],
    as.data.frame(matY))
}
scenario_09 |>
  fst::write_fst(path = "inst/extdata/scenario_09.fst",
            compress = 100)
rm(scenario_09)
