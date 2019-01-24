/*
 * splx_colors_mex.c
 *
 * Code generation for function 'splx_colors'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "mex.h"
#include "splx_colors_api.h"
#include "splx_colors_initialize.h"
#include "splx_colors_terminate.h"

/* Type Definitions */

/* Function Declarations */
static void splx_colors_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]);

/* Variable Definitions */
emlrtContext emlrtContextGlobal = { true, false, EMLRT_VERSION_INFO, NULL, "splx_colors", NULL, false, NULL };

/* Function Definitions */
static void splx_colors_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Temporary copy for mex outputs. */
  mxArray *outputs[1];
  int n = 0;
  int nOutputs = (nlhs < 1 ? 1 : nlhs);
  /* Check for proper number of arguments. */
  if(nrhs != 2) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:WrongNumberOfInputs","2 inputs required for entry-point 'splx_colors'.");
  } else if(nlhs > 1) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:TooManyOutputArguments","Too many output arguments for entry-point 'splx_colors'.");
  }
  /* Module initialization. */
  splx_colors_initialize(&emlrtContextGlobal);
  /* Call the function. */
  splx_colors_api(prhs,(const mxArray**)outputs);
  /* Copy over outputs to the caller. */
  for (n = 0; n < nOutputs; ++n) {
    plhs[n] = emlrtReturnArrayR2009a(outputs[n]);
  }
  /* Module finalization. */
  splx_colors_terminate();
}
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Initialize the memory manager. */
  mexAtExit(splx_colors_atexit);
  emlrtClearAllocCount(&emlrtContextGlobal, 0, 0, NULL);
  /* Dispatch the entry-point. */
  splx_colors_mexFunction(nlhs, plhs, nrhs, prhs);
}
/* End of code generation (splx_colors_mex.c) */
