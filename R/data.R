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

#' Scenario 1
#'
#' Data for the case where \eqn{\lambda = 0,} \eqn{\rho = 0} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 1st row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_01"

#' Scenario 2
#'
#' Data for the case where \eqn{\lambda = 0.5,} \eqn{\rho = 0} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 2nd row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_02"

#' Scenario 3
#'
#' Data for the case where \eqn{\lambda = 1,} \eqn{\rho = 0} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 3rd row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_03"

#' Scenario 4
#'
#' Data for the case where \eqn{\lambda = 0,} \eqn{\rho = 0.25} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 4th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_04"

#' Scenario 5
#'
#' Data for the case where \eqn{\lambda = 0.5,} \eqn{\rho = 0.25} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 5th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_05"

#' Scenario 6
#'
#' Data for the case where \eqn{\lambda = 1,} \eqn{\rho = 0.25} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 6th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_06"

#' Scenario 7
#'
#' Data for the case where \eqn{\lambda = 0,} \eqn{\rho = 0.75} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 7th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_07"

#' Scenario 8
#'
#' Data for the case where \eqn{\lambda = 0.5,} \eqn{\rho = 0.75} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 8th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_08"

#' Scenario 9
#'
#' Data for the case where \eqn{\lambda = 1,} \eqn{\rho = 0.75} and
#' \eqn{n \in \{250, 500, 750, 1000, 1250, 2500 \},} i.e.,
#' the 9th row of `parameters`.
#'
#' @format A list of matrices that contain the simulated observations.
#' @source Own calculations.
"scenario_09"
