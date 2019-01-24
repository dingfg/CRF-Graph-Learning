/*
 * splx_colors_terminate.c
 *
 * Code generation for function 'splx_colors_terminate'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "splx_colors_terminate.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */

void splx_colors_atexit(void)
{
    emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void splx_colors_terminate(void)
{
    emlrtLeaveRtStack(&emlrtContextGlobal);
}
/* End of code generation (splx_colors_terminate.c) */
