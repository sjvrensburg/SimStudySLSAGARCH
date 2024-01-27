#' Hyperbolic Secant SLSAGARCH(1, 1) Model Specification
#'
#' The specification object for an SLSAGARCH(1, 1) model with
#' hyperbolic secant distributed innovations. Estimation is
#' subject to the restriction that the unconditional variance
#' exists and the model is invertible.
#'
#' @format An object of type specification, from the SLS-AGARCH package.
#' @source Own calculations.
"sls_sech_spec"

#' Simulation Parameters
#'
#' Parameters used to simulate data.
#' The value of omega is selected to ensure that the unconditional volatility
#' equals one.
#'
#' @format A 9x6 data frame with a column for each parameter.
#' @source Own calculations.
"parameters"
