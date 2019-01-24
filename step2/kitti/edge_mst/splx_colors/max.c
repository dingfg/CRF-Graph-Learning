/*
 * max.c
 *
 * Code generation for function 'max'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "max.h"
#include "splx_colors_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo l_emlrtRSI = { 13, "max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/max.m" };
static emlrtRSInfo m_emlrtRSI = { 27, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtRSInfo n_emlrtRSI = { 62, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtRSInfo o_emlrtRSI = { 77, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo emlrtMCI = { 30, 9, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo b_emlrtMCI = { 27, 19, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo c_emlrtMCI = { 63, 9, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtMCInfo d_emlrtMCI = { 62, 19, "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m" };
static emlrtBCInfo pb_emlrtBCI = { -1, -1, 255, 41, "", "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo qb_emlrtBCI = { -1, -1, 239, 12, "", "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo rb_emlrtBCI = { -1, -1, 256, 24, "", "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo sb_emlrtBCI = { -1, -1, 279, 20, "", "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };
static emlrtBCInfo tb_emlrtBCI = { -1, -1, 280, 32, "", "eml_min_or_max", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_min_or_max.m", 0 };

/* Function Declarations */

/* Function Definitions */

/*
 * 
 */
real_T b_max(const emxArray_real_T *varargin_1)
{
    real_T maxval;
    boolean_T searchingForNonNaN;
    const mxArray *y;
    static const int32_T iv1[2] = { 1, 36 };
    const mxArray *m0;
    static const char_T cv1[36] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o', 'l', 'b', 'o', 'x', ':', 'a', 'u', 't', 'o', 'D', 'i', 'm', 'I', 'n', 'c', 'o', 'm', 'p', 'a', 't', 'i', 'b', 'i', 'l', 'i', 't', 'y' };
    const mxArray *b_y;
    static const int32_T iv2[2] = { 1, 39 };
    static const char_T cv2[39] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o', 'l', 'b', 'o', 'x', ':', 'e', 'm', 'l', '_', 'm', 'i', 'n', '_', 'o', 'r', '_', 'm', 'a', 'x', '_', 'v', 'a', 'r', 'D', 'i', 'm', 'Z', 'e', 'r', 'o' };
    int32_T n;
    int32_T itmp;
    int32_T ix;
    boolean_T guard1 = FALSE;
    int32_T k;
    boolean_T exitg1;
    EMLRTPUSHRTSTACK(&l_emlrtRSI);
    if ((varargin_1->size[0] == 1) || (varargin_1->size[0] != 1)) {
        searchingForNonNaN = TRUE;
    } else {
        searchingForNonNaN = FALSE;
    }
    if (searchingForNonNaN) {
    } else {
        EMLRTPUSHRTSTACK(&m_emlrtRSI);
        y = NULL;
        m0 = mxCreateCharArray(2, iv1);
        emlrtInitCharArray(36, m0, cv1);
        emlrtAssign(&y, m0);
        error(message(y, &emlrtMCI), &b_emlrtMCI);
        EMLRTPOPRTSTACK(&m_emlrtRSI);
    }
    if (varargin_1->size[0] > 0) {
    } else {
        EMLRTPUSHRTSTACK(&n_emlrtRSI);
        b_y = NULL;
        m0 = mxCreateCharArray(2, iv2);
        emlrtInitCharArray(39, m0, cv2);
        emlrtAssign(&b_y, m0);
        error(message(b_y, &c_emlrtMCI), &d_emlrtMCI);
        EMLRTPOPRTSTACK(&n_emlrtRSI);
    }
    EMLRTPUSHRTSTACK(&o_emlrtRSI);
    n = varargin_1->size[0];
    emlrtDynamicBoundsCheckR2011a(1, 1, varargin_1->size[0], &qb_emlrtBCI, &emlrtContextGlobal);
    maxval = varargin_1->data[0];
    itmp = 2;
    if (n == 1) {
    } else {
        ix = 1;
        guard1 = FALSE;
        if (muDoubleScalarIsNaN(varargin_1->data[0])) {
            searchingForNonNaN = TRUE;
            k = 3;
            exitg1 = 0U;
            while ((exitg1 == 0U) && (k - 1 <= n)) {
                ix++;
                emlrtDynamicBoundsCheckR2011a(ix, 1, varargin_1->size[0], &pb_emlrtBCI, &emlrtContextGlobal);
                if (!muDoubleScalarIsNaN(varargin_1->data[ix - 1])) {
                    maxval = varargin_1->data[emlrtDynamicBoundsCheckR2011a(ix, 1, varargin_1->size[0], &rb_emlrtBCI, &emlrtContextGlobal) - 1];
                    itmp = k;
                    searchingForNonNaN = FALSE;
                    exitg1 = 1U;
                } else {
                    k++;
                }
            }
            if (searchingForNonNaN) {
            } else {
                guard1 = TRUE;
            }
        } else {
            guard1 = TRUE;
        }
        if (guard1 == TRUE) {
            while (itmp <= n) {
                if (varargin_1->data[emlrtDynamicBoundsCheckR2011a(itmp, 1, varargin_1->size[0], &sb_emlrtBCI, &emlrtContextGlobal) - 1] > maxval) {
                    maxval = varargin_1->data[emlrtDynamicBoundsCheckR2011a(itmp, 1, varargin_1->size[0], &tb_emlrtBCI, &emlrtContextGlobal) - 1];
                }
                itmp++;
            }
        }
    }
    EMLRTPOPRTSTACK(&o_emlrtRSI);
    EMLRTPOPRTSTACK(&l_emlrtRSI);
    return maxval;
}
/* End of code generation (max.c) */
