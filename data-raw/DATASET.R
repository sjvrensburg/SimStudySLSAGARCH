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
