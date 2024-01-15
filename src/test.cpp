#include <Rcpp.h>
#include <random>
#include <pcg_random.hpp>
#include <RcppParallel.h>

struct RandomFill : public RcppParallel::Worker {
  RcppParallel::RMatrix<double> output;
  uint64_t seed;
  std::uniform_real_distribution<double> dist;

  RandomFill(Rcpp::NumericMatrix output, const uint64_t seed) : 
    output(output), seed(seed), dist(std::uniform_real_distribution<double>(0., 1.)) {};

  void operator()(std::size_t begin, std::size_t end) {
    pcg64 rng(seed, end);
    for (std::size_t col = begin; col < end; ++col) {
      for (std::size_t row = 0; row < output.nrow(); row++) {
        output(row, col) = dist(rng);
      }
    }
  }
};

// [[Rcpp::export]]
Rcpp::NumericMatrix parallel_random_matrix(
    const unsigned int n, const unsigned int m, const unsigned int ncores,
    const unsigned int seed) {
  Rcpp::NumericMatrix res(n, m);
  RandomFill randomFill(res, seed);
  RcppParallel::parallelFor(0, m, randomFill, m/ncores + 1);
  return res;
}