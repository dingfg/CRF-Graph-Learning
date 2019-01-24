/*
 * splx_colors_mexutil.c
 *
 * Code generation for function 'splx_colors_mexutil'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "splx_colors_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */

void error(const mxArray *b, emlrtMCInfo *location)
{
    const mxArray *pArray;
    pArray = b;
    emlrtCallMATLAB(0, NULL, 1, &pArray, "error", TRUE, location);
}

const mxArray *message(const mxArray *b, emlrtMCInfo *location)
{
    const mxArray *pArray;
    const mxArray *m2;
    pArray = b;
    return emlrtCallMATLAB(1, &m2, 1, &pArray, "message", TRUE, location);
}
/* End of code generation (splx_colors_mexutil.c) */
