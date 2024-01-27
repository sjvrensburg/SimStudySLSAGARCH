# Specification
spec <- SLSAGARCH::specification(type = "S")

# Parameters
# We select omega such that hbar = h0 = 1.
parameters <- expand.grid(
  h0 = 1, omega = 1,
  alpha = 0.075, beta = 0.85,
  lambda = c(0, 0.5, 1),
  rho = c(0, 0.25, 0.75)
)
P <- apply(parameters, 1, function(x) {
  SLSAGARCH:::persistence.specification(spec, x)
})
parameters[, 2] <- 1 - P

# MC specifications
R <- 10000
n <- c(250, 500, 750, 1500, 2500)

# Generate all of the data
