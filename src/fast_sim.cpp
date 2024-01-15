#include <RcppEigen.h>
#include <dqrng_generator.h>
#include <dqrng_distribution.h>
#include <xoshiro.h>
#include <SLSAGARCH_RcppExports.h>
#include <RcppParallel.h>

// using namespace RcppParallel;

// struct SechSLSsim: public Worker
// {
//   // RNG
//   const dqrng::uniform_distribution dist;
//   const dqrng::xoshiro256plus rng;

//   // input parameter
//   const RVector<double> vecParam;
//   double dblH0;

//   // seed
//   uint64_t seed;

//   // output
//   RMatrix<double> matY;

//   // constructor
//   SechSLSsim(
//     const Rcpp::NumericVector &vecParam_, const uint64_t &seed_,
//     const Rcpp::NumericMatrix &matY_) :
//     vecParam(vecParam_), seed(seed_), matY(matY_),
//     dist(dqrng::uniform_distribution(0.0, 1.0)),
//     rng(dqrng::xoshiro256plus(seed_)){
//       // create vector of parameters
//       Eigen::VectorXd theta(7);
//       for (auto i = 0; i < 5; i++) theta(i) = vecParam_(i);
//       theta(5) = 0;
//       theta(6) = 0;
//       // calculate...
//       dblH0 = SLSAGARCH::dblAGARCHmuk(theta, 2u, 1u);
//   };

//   void operator()(std::size_t begin, std::size_t end) {
//     dqrng::xoshiro256plus lrng(rng);
//     lrng.long_jump(end);
//     // Sample from a hyperbolic secant distribution.
//     for (std::size_t col = begin; col < end; ++col) {
//       for (std::size_t row = 0; row < matY.nrow(); row++) {
//         matY(row, col) = dist(lrng);
//       }
//     }
//   }
// };

// Sample from an SLS-AGARCH(1, 1) model.
// Assess the quality of the sample.
