/*
 * gradient.c
 *
 * Code generation for function 'gradient'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "gradient.h"
#include "splx_colors_emxutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo p_emlrtRSI = { 24, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRSInfo q_emlrtRSI = { 48, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRSInfo r_emlrtRSI = { 48, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRTEInfo o_emlrtRTEI = { 57, 1, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRTEInfo p_emlrtRTEI = { 27, 9, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRTEInfo q_emlrtRTEI = { 1, 22, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRTEInfo r_emlrtRTEI = { 57, 1, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtRTEInfo s_emlrtRTEI = { 54, 14, "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m" };
static emlrtBCInfo ub_emlrtBCI = { -1, -1, 79, 13, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo vb_emlrtBCI = { -1, -1, 79, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo wb_emlrtBCI = { -1, -1, 79, 53, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo xb_emlrtBCI = { -1, -1, 88, 13, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo yb_emlrtBCI = { -1, -1, 88, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo ac_emlrtBCI = { -1, -1, 88, 29, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo bc_emlrtBCI = { -1, -1, 83, 22, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo cc_emlrtBCI = { -1, -1, 84, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo dc_emlrtBCI = { -1, -1, 82, 17, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo ec_emlrtBCI = { -1, -1, 79, 13, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo fc_emlrtBCI = { -1, -1, 79, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo gc_emlrtBCI = { -1, -1, 79, 53, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo hc_emlrtBCI = { -1, -1, 88, 13, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo ic_emlrtBCI = { -1, -1, 88, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo jc_emlrtBCI = { -1, -1, 88, 29, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo kc_emlrtBCI = { -1, -1, 83, 22, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo lc_emlrtBCI = { -1, -1, 84, 21, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };
static emlrtBCInfo mc_emlrtBCI = { -1, -1, 82, 17, "", "gradient", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/datafun/gradient.m", 0 };

/* Function Declarations */
static void gradf(const emxArray_real_T *f, emxArray_real_T *y);

/* Function Definitions */

/*
 * 
 */
static void gradf(const emxArray_real_T *f, emxArray_real_T *y)
{
    int32_T vlen;
    int32_T i2;
    int32_T i;
    int32_T loop_ub;
    int32_T npages;
    int32_T i1;
    int32_T k;
    real_T A;
    vlen = f->size[0];
    for (i2 = 0; i2 < 2; i2++) {
        i = y->size[0] * y->size[1];
        y->size[i2] = f->size[i2];
        emxEnsureCapacity((emxArray__common *)y, i, (int32_T)sizeof(real_T), &r_emlrtRTEI);
    }
    if (vlen < 2) {
        i2 = y->size[0] * y->size[1];
        emxEnsureCapacity((emxArray__common *)y, i2, (int32_T)sizeof(real_T), &s_emlrtRTEI);
        loop_ub = y->size[1] - 1;
        for (i2 = 0; i2 <= loop_ub; i2++) {
            npages = y->size[0] - 1;
            for (i = 0; i <= npages; i++) {
                y->data[i + y->size[0] * i2] = 0.0;
            }
        }
    } else {
        npages = f->size[1];
        i2 = 0;
        for (i = 1; i <= npages; i++) {
            i1 = i2 + 1;
            i2 += vlen;
            y->data[emlrtDynamicBoundsCheckR2011a(i1, 1, y->size[0] * y->size[1], &ec_emlrtBCI, &emlrtContextGlobal) - 1] = f->data[emlrtDynamicBoundsCheckR2011a(i1 + 1, 1, f->size[0] * f->size[1], &fc_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a(i1, 1, f->size[0] * f->size[1], &gc_emlrtBCI, &emlrtContextGlobal) - 1];
            loop_ub = vlen - 2;
            for (k = 1; k <= loop_ub; k++) {
                A = f->data[emlrtDynamicBoundsCheckR2011a((i1 + k) + 1, 1, f->size[0] * f->size[1], &kc_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a((i1 + k) - 1, 1, f->size[0] * f->size[1], &lc_emlrtBCI, &emlrtContextGlobal) - 1];
                y->data[emlrtDynamicBoundsCheckR2011a(i1 + k, 1, y->size[0] * y->size[1], &mc_emlrtBCI, &emlrtContextGlobal) - 1] = A / 2.0;
            }
            y->data[emlrtDynamicBoundsCheckR2011a(i2, 1, y->size[0] * y->size[1], &hc_emlrtBCI, &emlrtContextGlobal) - 1] = f->data[emlrtDynamicBoundsCheckR2011a(i2, 1, f->size[0] * f->size[1], &ic_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a(i2 - 1, 1, f->size[0] * f->size[1], &jc_emlrtBCI, &emlrtContextGlobal) - 1];
        }
    }
}

/*
 * 
 */
void gradient(const emxArray_real_T *f, emxArray_real_T *varargout_1, emxArray_real_T *varargout_2)
{
    boolean_T flg;
    int32_T i1;
    int32_T i2;
    int32_T loop_ub;
    int32_T vstride;
    int32_T vlen;
    int32_T j;
    int32_T k;
    real_T A;
    flg = FALSE;
    if (f->size[1] == 1) {
        flg = TRUE;
    }
    if (flg) {
        EMLRTPUSHRTSTACK(&p_emlrtRSI);
        gradf(f, varargout_1);
        EMLRTPOPRTSTACK(&p_emlrtRSI);
        for (i1 = 0; i1 < 2; i1++) {
            i2 = varargout_2->size[0] * varargout_2->size[1];
            varargout_2->size[i1] = f->size[i1];
            emxEnsureCapacity((emxArray__common *)varargout_2, i2, (int32_T)sizeof(real_T), &p_emlrtRTEI);
        }
        i1 = varargout_2->size[0] * varargout_2->size[1];
        emxEnsureCapacity((emxArray__common *)varargout_2, i1, (int32_T)sizeof(real_T), &q_emlrtRTEI);
        loop_ub = varargout_2->size[1] - 1;
        for (i1 = 0; i1 <= loop_ub; i1++) {
            vstride = varargout_2->size[0] - 1;
            for (i2 = 0; i2 <= vstride; i2++) {
                varargout_2->data[i2 + varargout_2->size[0] * i1] = 0.0;
            }
        }
    } else {
        EMLRTPUSHRTSTACK(&q_emlrtRSI);
        vlen = f->size[1];
        for (i1 = 0; i1 < 2; i1++) {
            i2 = varargout_1->size[0] * varargout_1->size[1];
            varargout_1->size[i1] = f->size[i1];
            emxEnsureCapacity((emxArray__common *)varargout_1, i2, (int32_T)sizeof(real_T), &o_emlrtRTEI);
        }
        if (vlen < 2) {
            i1 = varargout_1->size[0] * varargout_1->size[1];
            emxEnsureCapacity((emxArray__common *)varargout_1, i1, (int32_T)sizeof(real_T), &q_emlrtRTEI);
            loop_ub = varargout_1->size[1] - 1;
            for (i1 = 0; i1 <= loop_ub; i1++) {
                vstride = varargout_1->size[0] - 1;
                for (i2 = 0; i2 <= vstride; i2++) {
                    varargout_1->data[i2 + varargout_1->size[0] * i1] = 0.0;
                }
            }
        } else {
            vstride = f->size[0];
            i1 = 0;
            i2 = (vlen - 1) * vstride;
            for (j = 1; j <= vstride; j++) {
                i1++;
                i2++;
                varargout_1->data[emlrtDynamicBoundsCheckR2011a(i1, 1, varargout_1->size[0] * varargout_1->size[1], &ub_emlrtBCI, &emlrtContextGlobal) - 1] = f->data[emlrtDynamicBoundsCheckR2011a(i1 + vstride, 1, f->size[0] * f->size[1], &vb_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a(i1, 1, f->size[0] * f->size[1], &wb_emlrtBCI, &emlrtContextGlobal) - 1];
                loop_ub = vlen - 2;
                for (k = 1; k <= loop_ub; k++) {
                    A = f->data[emlrtDynamicBoundsCheckR2011a(i1 + (k + 1) * vstride, 1, f->size[0] * f->size[1], &bc_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a(i1 + (k - 1) * vstride, 1, f->size[0] * f->size[1], &cc_emlrtBCI, &emlrtContextGlobal) - 1];
                    varargout_1->data[emlrtDynamicBoundsCheckR2011a(i1 + k * vstride, 1, varargout_1->size[0] * varargout_1->size[1], &dc_emlrtBCI, &emlrtContextGlobal) - 1] = A / 2.0;
                }
                varargout_1->data[emlrtDynamicBoundsCheckR2011a(i2, 1, varargout_1->size[0] * varargout_1->size[1], &xb_emlrtBCI, &emlrtContextGlobal) - 1] = f->data[emlrtDynamicBoundsCheckR2011a(i2, 1, f->size[0] * f->size[1], &yb_emlrtBCI, &emlrtContextGlobal) - 1] - f->data[emlrtDynamicBoundsCheckR2011a(i2 - vstride, 1, f->size[0] * f->size[1], &ac_emlrtBCI, &emlrtContextGlobal) - 1];
            }
        }
        EMLRTPOPRTSTACK(&q_emlrtRSI);
        EMLRTPUSHRTSTACK(&r_emlrtRSI);
        gradf(f, varargout_2);
        EMLRTPOPRTSTACK(&r_emlrtRSI);
    }
}
/* End of code generation (gradient.c) */
