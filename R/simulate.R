# We need to make code that takes a vector of
# parameters, a specification and then simulates
# from that model.

dgp <- function(spec, param, n, R, seed, burn.in = 25000L, nthreads = 4L, ...) {
  # Simulate the innovations
  z <- prhs(n = n + burn.in, m = R, seed = seed,
            numThreads = nthreads)

  # Extract the parameters
  theta <- SLSAGARCH:::expand_par(spec = spec, x = param)
  h0 <- SLSAGARCH:::unconditional.specification(spec, param)
  theta <- theta[-1]

  # Pass the innovations to simulate
  ngrain <- ceiling(R / nthreads)
  res <- switch(
    spec$type,
    "a" = SLSAGARCH:::lstParallelGenerate(
      dblH0 = h0, matZ = z, vecParam = theta,
      intModel = 0L, intGrainSize = ngrain,
      intNumThreads = nthreads),
    "s" = SLSAGARCH:::lstParallelGenerate(
      dblH0 = h0, matZ = z, vecParam = theta,
      intModel = 1L, intGrainSize = ngrain,
      intNumThreads = nthreads)
  )

  # Extract the data
  res$y[-1 * 1:burn.in, ]
}

fit <- function(spec, ymat, ...) {
  # Estimate the model on each column of y

  # Extract the coefficients.
}

