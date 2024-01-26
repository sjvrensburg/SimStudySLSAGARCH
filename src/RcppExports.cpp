// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// prhs
NumericMatrix prhs(const std::size_t n, const std::size_t m, const unsigned int seed, const int numThreads);
RcppExport SEXP _SimStudySLSAGARCH_prhs(SEXP nSEXP, SEXP mSEXP, SEXP seedSEXP, SEXP numThreadsSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const std::size_t >::type n(nSEXP);
    Rcpp::traits::input_parameter< const std::size_t >::type m(mSEXP);
    Rcpp::traits::input_parameter< const unsigned int >::type seed(seedSEXP);
    Rcpp::traits::input_parameter< const int >::type numThreads(numThreadsSEXP);
    rcpp_result_gen = Rcpp::wrap(prhs(n, m, seed, numThreads));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_SimStudySLSAGARCH_prhs", (DL_FUNC) &_SimStudySLSAGARCH_prhs, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_SimStudySLSAGARCH(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}