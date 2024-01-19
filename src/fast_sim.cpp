#include <random>
#include <RcppEigen.h>
#include <RcppParallel.h>
#include <pcg_random.hpp>
#include <boost/math/constants/constants.hpp>
#include <SLSAGARCH_RcppExports.h>

using std::log;
using std::tan;
using std::uniform_real_distribution;
using Rcpp::NumericMatrix;
using RcppParallel::Worker;
using RcppParallel::RMatrix;
using boost::math::constants::pi;

struct SechInnovSim : public Worker {
  RMatrix<double> output;
  uint64_t seed;
  std::uniform_real_distribution<double> dist;

  SechInnovSim(NumericMatrix output, const uint64_t seed) :
    output(output), seed(seed),
    dist(uniform_real_distribution<double>(0., 1.)) {};

  void operator()(std::size_t begin, std::size_t end) {
    pcg64 rng(seed, end);
    for (std::size_t col = begin; col < end; ++col) {
      // Create the vector of innovations.
      for (std::size_t row = 0; row < output.nrow(); row++) {
        output(row, col) = 2.0 * log(tan(0.5 * pi<double>() * dist(rng))) / pi<double>();
      }
    }
  }
};

// [[Rcpp::export]]
NumericMatrix parallelRhs(
    const std::size_t n, const std::size_t m,
    const unsigned int seed) {
  NumericMatrix res(n, m);
  SechInnovSim sim(res, seed);
  RcppParallel::parallelFor(0, m, sim);
  return res;
}

