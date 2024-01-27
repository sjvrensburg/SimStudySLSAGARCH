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
seed <- 20240127L
R <- 10000
n <- c(250, 500, 750, 1000, 1250, 2500)

scenario_01 <- lapply(n, function(x) {
  par0 <- unlist(parameters[1, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_02 <- lapply(n, function(x) {
  par0 <- unlist(parameters[2, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_03 <- lapply(n, function(x) {
  par0 <- unlist(parameters[3, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_04 <- lapply(n, function(x) {
  par0 <- unlist(parameters[4, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_05 <- lapply(n, function(x) {
  par0 <- unlist(parameters[5, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_06 <- lapply(n, function(x) {
  par0 <- unlist(parameters[6, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_07 <- lapply(n, function(x) {
  par0 <- unlist(parameters[7, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_08 <- lapply(n, function(x) {
  par0 <- unlist(parameters[8, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})
scenario_09 <- lapply(n, function(x) {
  par0 <- unlist(parameters[9, ])
  dgp(spec = sls_sech_spec, param = par0,
      n = x, R = R, seed = seed, nthreads = 14L)
})

usethis::use_data(scenario_01, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_02, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_03, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_04, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_05, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_06, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_07, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_08, overwrite = TRUE, compress = "gzip")
usethis::use_data(scenario_09, overwrite = TRUE, compress = "gzip")
