/*
 * rdivide.c
 *
 * Code generation for function 'rdivide'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "rdivide.h"
#include "splx_colors_emxutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo eb_emlrtRSI = { 13, "rdivide", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/ops/rdivide.m" };
static emlrtRSInfo fb_emlrtRSI = { 12, "eml_div", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_div.m" };
static emlrtRTEInfo v_emlrtRTEI = { 1, 14, "rdivide", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/ops/rdivide.m" };
static emlrtECInfo l_emlrtECI = { 2, 21, 9, "eml_div", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_div.m" };

/* Function Declarations */

/* Function Definitions */

/*
 * 
 */
void rdivide(const emxArray_real_T *x, const emxArray_real_T *y, emxArray_real_T *z)
{
    int32_T i2;
    int32_T loop_ub;
    EMLRTPUSHRTSTACK(&eb_emlrtRSI);
    EMLRTPUSHRTSTACK(&fb_emlrtRSI);
    emlrtSizeEqCheckNDR2011a(*(int32_T (*)[2])x->size, *(int32_T (*)[2])y->size, &l_emlrtECI, &emlrtContextGlobal);
    i2 = z->size[0] * z->size[1];
    z->size[0] = 3;
    z->size[1] = x->size[1];
    emxEnsureCapacity((emxArray__common *)z, i2, (int32_T)sizeof(real_T), &v_emlrtRTEI);
    loop_ub = x->size[0] * x->size[1] - 1;
    for (i2 = 0; i2 <= loop_ub; i2++) {
        z->data[i2] = x->data[i2] / y->data[i2];
    }
    EMLRTPOPRTSTACK(&fb_emlrtRSI);
    EMLRTPOPRTSTACK(&eb_emlrtRSI);
}
/* End of code generation (rdivide.c) */
