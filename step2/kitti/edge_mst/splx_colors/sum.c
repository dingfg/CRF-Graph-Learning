/*
 * sum.c
 *
 * Code generation for function 'sum'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "sum.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtBCInfo rc_emlrtBCI = { 1, 3, 75, 13, "", "sum", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo sc_emlrtBCI = { -1, -1, 69, 22, "", "sum", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };
static emlrtBCInfo tc_emlrtBCI = { -1, -1, 72, 30, "", "sum", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/sum.m", 0 };

/* Function Declarations */

/* Function Definitions */

/*
 * 
 */
void sum(const emxArray_real32_T *x, real32_T y[3])
{
    int32_T vlen;
    int32_T iy;
    int32_T ixstart;
    int32_T j;
    int32_T ix;
    real32_T s;
    int32_T k;
    if (x->size[1] == 0) {
        for (vlen = 0; vlen < 3; vlen++) {
            y[vlen] = 0.0F;
        }
    } else {
        vlen = x->size[1];
        iy = 0;
        ixstart = 0;
        for (j = 0; j < 3; j++) {
            ixstart++;
            ix = ixstart;
            s = x->data[emlrtDynamicBoundsCheckR2011a(ixstart, 1, 3 * x->size[1], &sc_emlrtBCI, &emlrtContextGlobal) - 1];
            for (k = 2; k <= vlen; k++) {
                ix += 3;
                s += x->data[emlrtDynamicBoundsCheckR2011a(ix, 1, 3 * x->size[1], &tc_emlrtBCI, &emlrtContextGlobal) - 1];
            }
            iy++;
            y[emlrtBoundsCheckR2011a(iy, &rc_emlrtBCI, &emlrtContextGlobal) - 1] = s;
        }
    }
}
/* End of code generation (sum.c) */
