/*
 * find.c
 *
 * Code generation for function 'find'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "find.h"
#include "splx_colors_emxutil.h"
#include "splx_colors_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo x_emlrtRSI = { 211, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtMCInfo i_emlrtMCI = { 211, 9, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtRTEInfo t_emlrtRTEI = { 85, 5, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtRTEInfo u_emlrtRTEI = { 1, 20, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtBCInfo nc_emlrtBCI = { -1, -1, 221, 17, "", "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo oc_emlrtBCI = { -1, -1, 221, 17, "", "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo pc_emlrtBCI = { -1, -1, 203, 33, "", "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m", 0 };
static emlrtBCInfo qc_emlrtBCI = { -1, -1, 205, 17, "", "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m", 0 };

/* Function Declarations */

/* Function Definitions */

/*
 * 
 */
void find(const emxArray_boolean_T *x, emxArray_real_T *i)
{
    int32_T nx;
    int32_T idx;
    int32_T i1;
    uint32_T ii;
    boolean_T exitg1;
    boolean_T guard1 = FALSE;
    const mxArray *y;
    const mxArray *b_y;
    emxArray_int32_T *r11;
    emxArray_real_T *b_i;
    int32_T iv3[2];
    int32_T loop_ub;
    emxArray_int32_T r12;
    emlrtHeapReferenceStackEnterFcn();
    nx = x->size[1];
    idx = 0;
    i1 = i->size[0] * i->size[1];
    i->size[0] = 1;
    i->size[1] = nx;
    emxEnsureCapacity((emxArray__common *)i, i1, (int32_T)sizeof(real_T), &t_emlrtRTEI);
    ii = 1U;
    exitg1 = 0U;
    while ((exitg1 == 0U) && (ii <= (uint32_T)nx)) {
        guard1 = FALSE;
        if (x->data[emlrtDynamicBoundsCheckR2011a((int32_T)ii, 1, x->size[1], &pc_emlrtBCI, &emlrtContextGlobal) - 1]) {
            idx++;
            i->data[emlrtDynamicBoundsCheckR2011a(idx, 1, i->size[1], &qc_emlrtBCI, &emlrtContextGlobal) - 1] = (real_T)ii;
            if (idx >= nx) {
                exitg1 = 1U;
            } else {
                guard1 = TRUE;
            }
        } else {
            guard1 = TRUE;
        }
        if (guard1 == TRUE) {
            ii++;
        }
    }
    if (idx <= nx) {
    } else {
        EMLRTPUSHRTSTACK(&x_emlrtRSI);
        y = NULL;
        b_y = mxCreateString("Assertion failed.");
        emlrtAssign(&y, b_y);
        error(y, &i_emlrtMCI);
        EMLRTPOPRTSTACK(&x_emlrtRSI);
    }
    if (nx == 1) {
        if (idx == 0) {
            i1 = i->size[0] * i->size[1];
            i->size[0] = 1;
            i->size[1] = 0;
            emxEnsureCapacity((emxArray__common *)i, i1, (int32_T)sizeof(real_T), &u_emlrtRTEI);
        }
    } else {
        if (1 > idx) {
            i1 = 0;
        } else {
            emlrtDynamicBoundsCheckR2011a(1, 1, i->size[1], &nc_emlrtBCI, &emlrtContextGlobal);
            i1 = emlrtDynamicBoundsCheckR2011a(idx, 1, i->size[1], &oc_emlrtBCI, &emlrtContextGlobal);
        }
        emxInit_int32_T(&r11, 1, &u_emlrtRTEI, TRUE);
        nx = r11->size[0];
        r11->size[0] = i1;
        emxEnsureCapacity((emxArray__common *)r11, nx, (int32_T)sizeof(int32_T), &u_emlrtRTEI);
        idx = i1 - 1;
        for (i1 = 0; i1 <= idx; i1++) {
            r11->data[i1] = 1 + i1;
        }
        emxInit_real_T(&b_i, 2, &u_emlrtRTEI, TRUE);
        iv3[0] = 1;
        iv3[1] = r11->size[0];
        i1 = b_i->size[0] * b_i->size[1];
        b_i->size[0] = iv3[0];
        b_i->size[1] = iv3[1];
        emxEnsureCapacity((emxArray__common *)b_i, i1, (int32_T)sizeof(real_T), &u_emlrtRTEI);
        idx = iv3[1] - 1;
        for (i1 = 0; i1 <= idx; i1++) {
            loop_ub = iv3[0] - 1;
            for (nx = 0; nx <= loop_ub; nx++) {
                r12 = *r11;
                r12.size = (int32_T *)&iv3;
                r12.numDimensions = 1;
                b_i->data[nx + b_i->size[0] * i1] = i->data[r12.data[nx + r12.size[0] * i1] - 1];
            }
        }
        emxFree_int32_T(&r11);
        i1 = i->size[0] * i->size[1];
        i->size[0] = 1;
        i->size[1] = b_i->size[1];
        emxEnsureCapacity((emxArray__common *)i, i1, (int32_T)sizeof(real_T), &u_emlrtRTEI);
        idx = b_i->size[1] - 1;
        for (i1 = 0; i1 <= idx; i1++) {
            i->data[i->size[0] * i1] = b_i->data[b_i->size[0] * i1];
        }
        emxFree_real_T(&b_i);
    }
    emlrtHeapReferenceStackLeaveFcn();
}
/* End of code generation (find.c) */
