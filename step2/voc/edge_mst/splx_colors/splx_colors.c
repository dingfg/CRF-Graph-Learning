/*
 * splx_colors.c
 *
 * Code generation for function 'splx_colors'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "sum.h"
#include "splx_colors_emxutil.h"
#include "rdivide.h"
#include "find.h"
#include "gradient.h"
#include "max.h"
#include "splx_colors_mexutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo b_emlrtRSI = { 12, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo c_emlrtRSI = { 27, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo d_emlrtRSI = { 33, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo e_emlrtRSI = { 35, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo f_emlrtRSI = { 38, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo g_emlrtRSI = { 41, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo h_emlrtRSI = { 44, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo i_emlrtRSI = { 46, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo j_emlrtRSI = { 46, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo k_emlrtRSI = { 48, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRSInfo s_emlrtRSI = { 11, "eml_li_find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtRSInfo t_emlrtRSI = { 14, "eml_li_find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtRSInfo ab_emlrtRSI = { 96, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtRSInfo bb_emlrtRSI = { 211, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtRSInfo cb_emlrtRSI = { 34, "power", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/ops/power.m" };
static emlrtRSInfo db_emlrtRSI = { 34, "power", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/ops/power.m" };
static emlrtMCInfo e_emlrtMCI = { 14, 5, "eml_li_find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/eml/eml_li_find.m" };
static emlrtMCInfo k_emlrtMCI = { 97, 9, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtMCInfo l_emlrtMCI = { 96, 19, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtMCInfo m_emlrtMCI = { 211, 9, "find", "/usr/local/MATLAB/R2011a/toolbox/eml/lib/matlab/elmat/find.m" };
static emlrtRTEInfo emlrtRTEI = { 1, 15, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo b_emlrtRTEI = { 12, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo c_emlrtRTEI = { 35, 11, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo d_emlrtRTEI = { 46, 32, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo e_emlrtRTEI = { 41, 24, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo f_emlrtRTEI = { 9, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo g_emlrtRTEI = { 11, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo h_emlrtRTEI = { 15, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo i_emlrtRTEI = { 17, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo j_emlrtRTEI = { 18, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo k_emlrtRTEI = { 23, 5, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo l_emlrtRTEI = { 33, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo m_emlrtRTEI = { 35, 5, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtRTEInfo n_emlrtRTEI = { 45, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo emlrtECI = { 2, 11, 10, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtBCInfo emlrtBCI = { -1, -1, 21, 10, "lim_", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo emlrtDCI = { 24, 31, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo b_emlrtBCI = { -1, -1, 24, 31, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo b_emlrtDCI = { 24, 15, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo c_emlrtBCI = { -1, -1, 24, 15, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo c_emlrtDCI = { 27, 25, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo d_emlrtBCI = { -1, -1, 27, 25, "ssum2", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo d_emlrtDCI = { 27, 13, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo e_emlrtBCI = { -1, -1, 27, 13, "ssum2", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtECInfo b_emlrtECI = { -1, 37, 10, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo c_emlrtECI = { -1, 37, 18, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo d_emlrtECI = { -1, 37, 30, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo e_emlrtECI = { 2, 37, 9, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo f_emlrtECI = { 2, 37, 9, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtDCInfo e_emlrtDCI = { 38, 15, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo f_emlrtBCI = { -1, -1, 38, 15, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo f_emlrtDCI = { 41, 13, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo g_emlrtBCI = { -1, -1, 41, 13, "ssum2", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtECInfo g_emlrtECI = { 2, 46, 17, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo h_emlrtECI = { -1, 48, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo i_emlrtECI = { -1, 46, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtECInfo j_emlrtECI = { 2, 53, 8, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtBCInfo h_emlrtBCI = { 0, MAX_int32_T, 12, 3, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo g_emlrtDCI = { 12, 3, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 4 };
static emlrtBCInfo i_emlrtBCI = { 0, MAX_int32_T, 46, 32, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo j_emlrtBCI = { -1, -1, 46, 32, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo k_emlrtBCI = { -1, -1, 35, 11, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo l_emlrtBCI = { -1, -1, 35, 11, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtECInfo k_emlrtECI = { -1, 35, 11, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m" };
static emlrtBCInfo m_emlrtBCI = { -1, -1, 41, 24, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo h_emlrtDCI = { 15, 19, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtDCInfo i_emlrtDCI = { 15, 19, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 4 };
static emlrtBCInfo n_emlrtBCI = { -1, -1, 12, 3, "lim_", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo j_emlrtDCI = { 15, 19, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtDCInfo k_emlrtDCI = { 15, 19, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 4 };
static emlrtBCInfo o_emlrtBCI = { -1, -1, 45, 22, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo l_emlrtDCI = { 45, 22, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo p_emlrtBCI = { -1, -1, 46, 25, "ssum2", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo q_emlrtBCI = { -1, -1, 46, 42, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo r_emlrtBCI = { -1, -1, 46, 10, "svar", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo s_emlrtBCI = { -1, -1, 48, 13, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo t_emlrtBCI = { -1, -1, 48, 29, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo u_emlrtBCI = { -1, -1, 46, 32, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo v_emlrtBCI = { -1, -1, 35, 21, "ii", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo w_emlrtBCI = { -1, -1, 35, 11, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo x_emlrtBCI = { -1, -1, 35, 11, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo y_emlrtBCI = { -1, -1, 37, 10, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo ab_emlrtBCI = { -1, -1, 37, 18, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo bb_emlrtBCI = { -1, -1, 37, 30, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo cb_emlrtBCI = { -1, -1, 38, 15, "ii", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo db_emlrtBCI = { -1, -1, 39, 13, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo m_emlrtDCI = { 39, 13, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo eb_emlrtBCI = { -1, -1, 39, 13, "ii", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo fb_emlrtBCI = { -1, -1, 41, 13, "ii", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo gb_emlrtBCI = { -1, -1, 41, 24, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo hb_emlrtBCI = { -1, -1, 23, 10, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo ib_emlrtBCI = { -1, -1, 23, 15, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo jb_emlrtBCI = { -1, -1, 23, 24, "I", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo kb_emlrtBCI = { -1, -1, 25, 13, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo n_emlrtDCI = { 25, 13, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo lb_emlrtBCI = { -1, -1, 25, 27, "smean", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtDCInfo o_emlrtDCI = { 25, 27, "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 1 };
static emlrtBCInfo mb_emlrtBCI = { -1, -1, 12, 3, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo nb_emlrtBCI = { -1, -1, 12, 3, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };
static emlrtBCInfo ob_emlrtBCI = { -1, -1, 12, 3, "", "splx_colors", "/home/ccadena/Dropbox/GMU/GMUcode/utils/splx_colors.m", 0 };

/* Function Declarations */

/* Function Definitions */

/*
 * function cl = splx_colors(lim,I)
 */
void splx_colors(const emxArray_real_T *lim, const emxArray_real32_T *I, emxArray_real_T *cl)
{
    emxArray_real_T *lim_;
    int32_T b_lim[1];
    emxArray_real_T c_lim;
    real_T S;
    int32_T r;
    int32_T c;
    int32_T i0;
    int32_T loop_ub;
    emxArray_boolean_T *gidx;
    emxArray_real_T *gx;
    emxArray_real_T *gy;
    int32_T n;
    int32_T k;
    int32_T i;
    const mxArray *y;
    const mxArray *b_y;
    emxArray_int32_T *r0;
    emxArray_real_T *smean;
    emxArray_real_T *ssum2;
    emxArray_real_T *svar;
    real32_T rgb[3];
    real_T b_smean[3];
    real32_T c_y[3];
    emxArray_boolean_T *c_smean;
    emxArray_real_T *ii;
    uint32_T b_i;
    emxArray_real32_T *b_rgb;
    emxArray_real_T *ii2;
    emxArray_real_T *r1;
    emxArray_real_T *r2;
    emxArray_real_T *r3;
    emxArray_real32_T *d_y;
    emxArray_int32_T *r4;
    emxArray_int32_T *r5;
    emxArray_real_T *r6;
    emxArray_real_T *b_ii2;
    emxArray_real32_T *b_I;
    emxArray_real32_T *c_I;
    emxArray_real32_T *d_I;
    emxArray_real32_T *e_I;
    real_T b_ii;
    boolean_T b0;
    const mxArray *e_y;
    static const int32_T iv0[2] = { 1, 36 };
    static const char_T cv0[36] = { 'C', 'o', 'd', 'e', 'r', ':', 't', 'o', 'o', 'l', 'b', 'o', 'x', ':', 'f', 'i', 'n', 'd', '_', 'i', 'n', 'c', 'o', 'm', 'p', 'a', 't', 'i', 'b', 'l', 'e', 'S', 'h', 'a', 'p', 'e' };
    boolean_T exitg1;
    boolean_T guard1 = FALSE;
    const mxArray *f_y;
    int32_T num;
    uint32_T uv0[2];
    emxArray_boolean_T *d_smean;
    emxArray_real_T *e_smean;
    emxArray_real_T *b_n;
    emxArray_real_T *f_smean;
    emxArray_real_T *g_y;
    emxArray_real_T *g_smean;
    int32_T c_ii[1];
    emxArray_real_T *h_y;
    emxArray_real_T *b_ssum2;
    int32_T c_ssum2[2];
    emxArray_real_T *r7;
    emxArray_real_T *d_ssum2;
    emxArray_real_T *c_n;
    emxArray_real_T *r8;
    emxArray_real_T *h_smean;
    emxArray_real_T *r9;
    emxArray_int32_T *r10;
    emlrtHeapReferenceStackEnterFcn();
    emxInit_real_T(&lim_, 2, &f_emlrtRTEI, TRUE);
    /* 'splx_colors:3' S = max(lim(:)); */
    EMLRTPUSHRTSTACK(&emlrtRSI);
    b_lim[0] = lim->size[0] * lim->size[1];
    c_lim = *lim;
    c_lim.size = (int32_T *)&b_lim;
    c_lim.numDimensions = 1;
    S = b_max(&c_lim);
    EMLRTPOPRTSTACK(&emlrtRSI);
    /* 'splx_colors:4' [r c ~] = size(I); */
    r = I->size[0];
    c = I->size[1];
    /* don't consider pixels at boundaries of superpixels  */
    /* for computing mean color */
    /* 'splx_colors:9' lim_ = lim; */
    i0 = lim_->size[0] * lim_->size[1];
    lim_->size[0] = lim->size[0];
    lim_->size[1] = lim->size[1];
    emxEnsureCapacity((emxArray__common *)lim_, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = lim->size[0] * lim->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        lim_->data[i0] = lim->data[i0];
    }
    emxInit_boolean_T(&gidx, 2, &g_emlrtRTEI, TRUE);
    emxInit_real_T(&gx, 2, &emlrtRTEI, TRUE);
    emxInit_real_T(&gy, 2, &emlrtRTEI, TRUE);
    /* 'splx_colors:10' [gx,gy] = gradient(double(lim)); */
    gradient(lim, gx, gy);
    /* 'splx_colors:11' gidx = gx | gy; */
    emlrtSizeEqCheckNDR2011a(*(int32_T (*)[2])gx->size, *(int32_T (*)[2])gy->size, &emlrtECI, &emlrtContextGlobal);
    i0 = gidx->size[0] * gidx->size[1];
    gidx->size[0] = gx->size[0];
    gidx->size[1] = gx->size[1];
    emxEnsureCapacity((emxArray__common *)gidx, i0, (int32_T)sizeof(boolean_T), &emlrtRTEI);
    loop_ub = gx->size[0] * gx->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        gidx->data[i0] = ((gx->data[i0] != 0.0) || (gy->data[i0] != 0.0));
    }
    emxFree_real_T(&gy);
    emxFree_real_T(&gx);
    /* 'splx_colors:12' lim_(gidx) = 0; */
    EMLRTPUSHRTSTACK(&b_emlrtRSI);
    n = emlrtBoundsCheckR2011a(gidx->size[0] * gidx->size[1], &h_emlrtBCI, &emlrtContextGlobal);
    EMLRTPUSHRTSTACK(&s_emlrtRSI);
    k = 0;
    for (i = 1; i <= n; i++) {
        if (gidx->data[emlrtDynamicBoundsCheckR2011a(i, 1, gidx->size[0] * gidx->size[1], &ob_emlrtBCI, &emlrtContextGlobal) - 1]) {
            k++;
        }
    }
    EMLRTPOPRTSTACK(&s_emlrtRSI);
    if (k <= n) {
    } else {
        EMLRTPUSHRTSTACK(&t_emlrtRSI);
        y = NULL;
        b_y = mxCreateString("Assertion failed.");
        emlrtAssign(&y, b_y);
        error(y, &e_emlrtMCI);
        EMLRTPOPRTSTACK(&t_emlrtRSI);
    }
    emxInit_int32_T(&r0, 1, &emlrtRTEI, TRUE);
    emlrtNonNegativeCheckR2011a((real_T)k, &g_emlrtDCI, &emlrtContextGlobal);
    i0 = r0->size[0];
    r0->size[0] = k;
    emxEnsureCapacity((emxArray__common *)r0, i0, (int32_T)sizeof(int32_T), &b_emlrtRTEI);
    k = 1;
    for (i = 1; i <= n; i++) {
        if (gidx->data[emlrtDynamicBoundsCheckR2011a(i, 1, gidx->size[0] * gidx->size[1], &mb_emlrtBCI, &emlrtContextGlobal) - 1]) {
            r0->data[emlrtDynamicBoundsCheckR2011a(k, 1, r0->size[0], &nb_emlrtBCI, &emlrtContextGlobal) - 1] = i;
            k++;
        }
    }
    EMLRTPOPRTSTACK(&b_emlrtRSI);
    loop_ub = r0->size[0] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        lim_->data[emlrtDynamicBoundsCheckR2011a(r0->data[i0], 1, lim->size[0] * lim->size[1], &n_emlrtBCI, &emlrtContextGlobal) - 1] = 0.0;
    }
    emxInit_real_T(&smean, 2, &h_emlrtRTEI, TRUE);
    /* 'splx_colors:15' smean = zeros(4,S); */
    i0 = smean->size[0] * smean->size[1];
    smean->size[0] = 4;
    smean->size[1] = (int32_T)emlrtIntegerCheckR2011a(emlrtNonNegativeCheckR2011a(S, &i_emlrtDCI, &emlrtContextGlobal), &h_emlrtDCI, &emlrtContextGlobal);
    emxEnsureCapacity((emxArray__common *)smean, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = ((int32_T)emlrtIntegerCheckR2011a(emlrtNonNegativeCheckR2011a(S, &k_emlrtDCI, &emlrtContextGlobal), &j_emlrtDCI, &emlrtContextGlobal) << 2) - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        smean->data[i0] = 0.0;
    }
    emxInit_real_T(&ssum2, 2, &i_emlrtRTEI, TRUE);
    /* 'splx_colors:17' ssum2=zeros(3,S); */
    i0 = ssum2->size[0] * ssum2->size[1];
    ssum2->size[0] = 3;
    ssum2->size[1] = (int32_T)S;
    emxEnsureCapacity((emxArray__common *)ssum2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = 3 * (int32_T)S - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        ssum2->data[i0] = 0.0;
    }
    emxInit_real_T(&svar, 2, &j_emlrtRTEI, TRUE);
    /* 'splx_colors:18' svar=zeros(3,S); */
    i0 = svar->size[0] * svar->size[1];
    svar->size[0] = 3;
    svar->size[1] = (int32_T)S;
    emxEnsureCapacity((emxArray__common *)svar, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = 3 * (int32_T)S - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        svar->data[i0] = 0.0;
    }
    /* 'splx_colors:20' for i=1:r*c */
    loop_ub = r * c;
    i = 0;
    while (i + 1 <= loop_ub) {
        /* 'splx_colors:21' si = lim_(i); */
        emlrtDynamicBoundsCheckR2011a(i + 1, 1, lim_->size[0] * lim_->size[1], &emlrtBCI, &emlrtContextGlobal);
        /* 'splx_colors:22' if si==0 */
        if (lim_->data[i] == 0.0) {
        } else {
            /* 'splx_colors:23' rgb=[I(i);I(i+r*c);I(i+2*r*c)]; */
            rgb[0] = I->data[emlrtDynamicBoundsCheckR2011a(i + 1, 1, I->size[0] * I->size[1] * 3, &hb_emlrtBCI, &emlrtContextGlobal) - 1];
            rgb[1] = I->data[emlrtDynamicBoundsCheckR2011a((i + r * c) + 1, 1, I->size[0] * I->size[1] * 3, &ib_emlrtBCI, &emlrtContextGlobal) - 1];
            rgb[2] = I->data[emlrtDynamicBoundsCheckR2011a((i + (r << 1) * c) + 1, 1, I->size[0] * I->size[1] * 3, &jb_emlrtBCI, &emlrtContextGlobal) - 1];
            /* 'splx_colors:24' smean(1:3,si) = smean(1:3,si)+rgb; */
            k = smean->size[1];
            n = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &b_emlrtDCI, &emlrtContextGlobal), 1, k, &c_emlrtBCI, &emlrtContextGlobal);
            k = smean->size[1];
            k = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &emlrtDCI, &emlrtContextGlobal), 1, k, &b_emlrtBCI, &emlrtContextGlobal);
            for (i0 = 0; i0 < 3; i0++) {
                b_smean[i0] = (real_T)((real32_T)smean->data[i0 + smean->size[0] * (k - 1)] + rgb[i0]);
            }
            for (i0 = 0; i0 < 3; i0++) {
                smean->data[i0 + smean->size[0] * (n - 1)] = b_smean[i0];
            }
            /* 'splx_colors:25' smean(4,si) = smean(4,si)+1; */
            smean->data[3 + smean->size[0] * (emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &n_emlrtDCI, &emlrtContextGlobal), 1, smean->size[1], &kb_emlrtBCI, &emlrtContextGlobal) - 1)] = smean->data[3 + smean->size[0] * (emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &o_emlrtDCI, &emlrtContextGlobal), 1, smean->size[1], &lb_emlrtBCI, &emlrtContextGlobal) - 1)] + 1.0;
            /* 'splx_colors:27' ssum2(:,si)=ssum2(:,si)+rgb.^2; */
            EMLRTPUSHRTSTACK(&c_emlrtRSI);
            for (k = 0; k < 3; k++) {
                c_y[k] = muSingleScalarPower(rgb[k], 2.0F);
            }
            k = ssum2->size[1];
            n = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &d_emlrtDCI, &emlrtContextGlobal), 1, k, &e_emlrtBCI, &emlrtContextGlobal);
            k = ssum2->size[1];
            k = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(lim_->data[i], &c_emlrtDCI, &emlrtContextGlobal), 1, k, &d_emlrtBCI, &emlrtContextGlobal);
            for (i0 = 0; i0 < 3; i0++) {
                b_smean[i0] = (real_T)((real32_T)ssum2->data[i0 + ssum2->size[0] * (k - 1)] + c_y[i0]);
            }
            for (i0 = 0; i0 < 3; i0++) {
                ssum2->data[i0 + ssum2->size[0] * (n - 1)] = b_smean[i0];
            }
            EMLRTPOPRTSTACK(&c_emlrtRSI);
        }
        i++;
        emlrtBreakCheck();
    }
    emxFree_real_T(&lim_);
    emxInit_boolean_T(&c_smean, 2, &emlrtRTEI, TRUE);
    /* some of the superpixels might have zero area */
    /* as the boundary pixels are not considered */
    /* recompute mean color with considering the boundary */
    /* 'splx_colors:33' ii = find(smean(4,:)==0); */
    EMLRTPUSHRTSTACK(&d_emlrtRSI);
    i0 = c_smean->size[0] * c_smean->size[1];
    c_smean->size[0] = 1;
    c_smean->size[1] = smean->size[1];
    emxEnsureCapacity((emxArray__common *)c_smean, i0, (int32_T)sizeof(boolean_T), &emlrtRTEI);
    loop_ub = smean->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        c_smean->data[c_smean->size[0] * i0] = (smean->data[3 + smean->size[0] * i0] == 0.0);
    }
    emxInit_real_T(&ii, 2, &l_emlrtRTEI, TRUE);
    find(c_smean, ii);
    EMLRTPOPRTSTACK(&d_emlrtRSI);
    /* 'splx_colors:34' for i=1:length(ii) */
    emxFree_boolean_T(&c_smean);
    if (ii->size[1] == 0) {
        loop_ub = 0;
    } else {
        loop_ub = ii->size[1];
    }
    b_i = 1U;
    emxInit_real32_T(&b_rgb, 2, &k_emlrtRTEI, TRUE);
    b_emxInit_real_T(&ii2, 1, &m_emlrtRTEI, TRUE);
    emxInit_real_T(&r1, 2, &emlrtRTEI, TRUE);
    emxInit_real_T(&r2, 2, &emlrtRTEI, TRUE);
    emxInit_real_T(&r3, 2, &emlrtRTEI, TRUE);
    emxInit_real32_T(&d_y, 2, &emlrtRTEI, TRUE);
    b_emxInit_int32_T(&r4, 2, &emlrtRTEI, TRUE);
    emxInit_int32_T(&r5, 1, &emlrtRTEI, TRUE);
    b_emxInit_real_T(&r6, 1, &emlrtRTEI, TRUE);
    b_emxInit_real_T(&b_ii2, 1, &emlrtRTEI, TRUE);
    emxInit_real32_T(&b_I, 2, &emlrtRTEI, TRUE);
    emxInit_real32_T(&c_I, 2, &emlrtRTEI, TRUE);
    emxInit_real32_T(&d_I, 2, &emlrtRTEI, TRUE);
    emxInit_real32_T(&e_I, 2, &emlrtRTEI, TRUE);
    while (b_i <= (uint32_T)loop_ub) {
        /* 'splx_colors:35' ii2 = find(lim==ii(i)); */
        EMLRTPUSHRTSTACK(&e_emlrtRSI);
        i0 = gidx->size[0] * gidx->size[1];
        gidx->size[0] = lim->size[0];
        gidx->size[1] = lim->size[1];
        emxEnsureCapacity((emxArray__common *)gidx, i0, (int32_T)sizeof(boolean_T), &emlrtRTEI);
        b_ii = ii->data[emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, ii->size[1], &v_emlrtBCI, &emlrtContextGlobal) - 1];
        i = lim->size[0] * lim->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            gidx->data[i0] = (lim->data[i0] == b_ii);
        }
        k = gidx->size[0] * gidx->size[1];
        n = 0;
        if ((!((gidx->size[0] == 1) || (gidx->size[1] == 1))) || (gidx->size[0] != 1) || (gidx->size[1] <= 1)) {
            b0 = TRUE;
        } else {
            b0 = FALSE;
        }
        if (b0) {
        } else {
            EMLRTPUSHRTSTACK(&ab_emlrtRSI);
            e_y = NULL;
            b_y = mxCreateCharArray(2, iv0);
            emlrtInitCharArray(36, b_y, cv0);
            emlrtAssign(&e_y, b_y);
            error(message(e_y, &k_emlrtMCI), &l_emlrtMCI);
            EMLRTPOPRTSTACK(&ab_emlrtRSI);
        }
        i0 = ii2->size[0];
        ii2->size[0] = k;
        emxEnsureCapacity((emxArray__common *)ii2, i0, (int32_T)sizeof(real_T), &c_emlrtRTEI);
        i = 1;
        exitg1 = 0U;
        while ((exitg1 == 0U) && (i <= k)) {
            guard1 = FALSE;
            if (gidx->data[emlrtDynamicBoundsCheckR2011a(i, 1, gidx->size[0] * gidx->size[1], &w_emlrtBCI, &emlrtContextGlobal) - 1]) {
                n++;
                ii2->data[emlrtDynamicBoundsCheckR2011a(n, 1, ii2->size[0], &x_emlrtBCI, &emlrtContextGlobal) - 1] = (real_T)i;
                if (n >= k) {
                    exitg1 = 1U;
                } else {
                    guard1 = TRUE;
                }
            } else {
                guard1 = TRUE;
            }
            if (guard1 == TRUE) {
                i++;
            }
        }
        if (n <= k) {
        } else {
            EMLRTPUSHRTSTACK(&bb_emlrtRSI);
            f_y = NULL;
            b_y = mxCreateString("Assertion failed.");
            emlrtAssign(&f_y, b_y);
            error(f_y, &m_emlrtMCI);
            EMLRTPOPRTSTACK(&bb_emlrtRSI);
        }
        if (k == 1) {
            if (n == 0) {
                i0 = ii2->size[0];
                ii2->size[0] = 0;
                emxEnsureCapacity((emxArray__common *)ii2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
            }
        } else {
            if (1 > n) {
                i0 = 0;
            } else {
                emlrtDynamicBoundsCheckR2011a(1, 1, ii2->size[0], &k_emlrtBCI, &emlrtContextGlobal);
                i0 = emlrtDynamicBoundsCheckR2011a(n, 1, ii2->size[0], &l_emlrtBCI, &emlrtContextGlobal);
            }
            k = r5->size[0];
            r5->size[0] = i0;
            emxEnsureCapacity((emxArray__common *)r5, k, (int32_T)sizeof(int32_T), &emlrtRTEI);
            i = i0 - 1;
            for (i0 = 0; i0 <= i; i0++) {
                r5->data[i0] = 1 + i0;
            }
            i0 = r4->size[0] * r4->size[1];
            r4->size[0] = 1;
            emxEnsureCapacity((emxArray__common *)r4, i0, (int32_T)sizeof(int32_T), &emlrtRTEI);
            k = r5->size[0];
            i0 = r4->size[0] * r4->size[1];
            r4->size[1] = k;
            emxEnsureCapacity((emxArray__common *)r4, i0, (int32_T)sizeof(int32_T), &emlrtRTEI);
            i = r5->size[0] - 1;
            for (i0 = 0; i0 <= i; i0++) {
                r4->data[i0] = r5->data[i0];
            }
            emlrtVectorVectorIndexCheckR2011a(ii2->size[0], 1, 1, r4->size[1], &k_emlrtECI, &emlrtContextGlobal);
            i0 = b_ii2->size[0];
            b_ii2->size[0] = r4->size[1];
            emxEnsureCapacity((emxArray__common *)b_ii2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
            i = r4->size[1] - 1;
            for (i0 = 0; i0 <= i; i0++) {
                b_ii2->data[i0] = ii2->data[r4->data[i0] - 1];
            }
            i0 = ii2->size[0];
            ii2->size[0] = b_ii2->size[0];
            emxEnsureCapacity((emxArray__common *)ii2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
            i = b_ii2->size[0] - 1;
            for (i0 = 0; i0 <= i; i0++) {
                ii2->data[i0] = b_ii2->data[i0];
            }
        }
        EMLRTPOPRTSTACK(&e_emlrtRSI);
        /* 'splx_colors:36' num = length(ii2); */
        if (ii2->size[0] == 0) {
            num = 0;
        } else if (ii2->size[0] > 1) {
            num = ii2->size[0];
        } else {
            num = 1;
        }
        /* 'splx_colors:37' rgb=[I(ii2');I(ii2'+r*c);I(ii2'+2*r*c)]; */
        i0 = r6->size[0];
        r6->size[0] = ii2->size[0];
        emxEnsureCapacity((emxArray__common *)r6, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        i = ii2->size[0] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            r6->data[i0] = (real_T)emlrtDynamicBoundsCheckR2011a((int32_T)ii2->data[i0], 1, I->size[0] * I->size[1] * 3, &y_emlrtBCI, &emlrtContextGlobal);
        }
        i0 = r1->size[0] * r1->size[1];
        r1->size[0] = 1;
        emxEnsureCapacity((emxArray__common *)r1, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        k = r6->size[0];
        i0 = r1->size[0] * r1->size[1];
        r1->size[1] = k;
        emxEnsureCapacity((emxArray__common *)r1, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        i = r6->size[0] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            r1->data[i0] = r6->data[i0];
        }
        emlrtMatrixMatrixIndexCheckR2011a(*(int32_T (*)[3])I->size, 3, *(int32_T (*)[2])r1->size, 2, &b_emlrtECI, &emlrtContextGlobal);
        i0 = r2->size[0] * r2->size[1];
        r2->size[0] = 1;
        emxEnsureCapacity((emxArray__common *)r2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        k = ii2->size[0];
        i0 = r2->size[0] * r2->size[1];
        r2->size[1] = k;
        emxEnsureCapacity((emxArray__common *)r2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        i = ii2->size[0] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            r2->data[i0] = ii2->data[i0];
        }
        emlrtMatrixMatrixIndexCheckR2011a(*(int32_T (*)[3])I->size, 3, *(int32_T (*)[2])r2->size, 2, &c_emlrtECI, &emlrtContextGlobal);
        i0 = r3->size[0] * r3->size[1];
        r3->size[0] = 1;
        emxEnsureCapacity((emxArray__common *)r3, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        k = ii2->size[0];
        i0 = r3->size[0] * r3->size[1];
        r3->size[1] = k;
        emxEnsureCapacity((emxArray__common *)r3, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        i = ii2->size[0] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            r3->data[i0] = ii2->data[i0];
        }
        emlrtMatrixMatrixIndexCheckR2011a(*(int32_T (*)[3])I->size, 3, *(int32_T (*)[2])r3->size, 2, &d_emlrtECI, &emlrtContextGlobal);
        n = r * c;
        i = r2->size[0] * r2->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            emlrtDynamicBoundsCheckR2011a((int32_T)(r2->data[i0] + (real_T)n), 1, I->size[0] * I->size[1] * 3, &ab_emlrtBCI, &emlrtContextGlobal);
        }
        i0 = b_I->size[0] * b_I->size[1];
        b_I->size[0] = 1;
        b_I->size[1] = r1->size[1];
        emxEnsureCapacity((emxArray__common *)b_I, i0, (int32_T)sizeof(real32_T), &emlrtRTEI);
        i = r1->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            b_I->data[b_I->size[0] * i0] = I->data[(int32_T)r1->data[r1->size[0] * i0] - 1];
        }
        i0 = c_I->size[0] * c_I->size[1];
        c_I->size[0] = 1;
        c_I->size[1] = r2->size[1];
        emxEnsureCapacity((emxArray__common *)c_I, i0, (int32_T)sizeof(real32_T), &emlrtRTEI);
        i = r2->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            c_I->data[c_I->size[0] * i0] = I->data[(int32_T)(r2->data[r2->size[0] * i0] + (real_T)n) - 1];
        }
        emlrtDimSizeEqCheckR2011a(b_I->size[1], c_I->size[1], &e_emlrtECI, &emlrtContextGlobal);
        k = (r << 1) * c;
        i = r3->size[0] * r3->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            emlrtDynamicBoundsCheckR2011a((int32_T)(r3->data[i0] + (real_T)k), 1, I->size[0] * I->size[1] * 3, &bb_emlrtBCI, &emlrtContextGlobal);
        }
        i0 = d_I->size[0] * d_I->size[1];
        d_I->size[0] = 1;
        d_I->size[1] = r1->size[1];
        emxEnsureCapacity((emxArray__common *)d_I, i0, (int32_T)sizeof(real32_T), &emlrtRTEI);
        i = r1->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            d_I->data[d_I->size[0] * i0] = I->data[(int32_T)r1->data[r1->size[0] * i0] - 1];
        }
        i0 = e_I->size[0] * e_I->size[1];
        e_I->size[0] = 1;
        e_I->size[1] = r3->size[1];
        emxEnsureCapacity((emxArray__common *)e_I, i0, (int32_T)sizeof(real32_T), &emlrtRTEI);
        i = r3->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            e_I->data[e_I->size[0] * i0] = I->data[(int32_T)(r3->data[r3->size[0] * i0] + (real_T)k) - 1];
        }
        emlrtDimSizeEqCheckR2011a(d_I->size[1], e_I->size[1], &f_emlrtECI, &emlrtContextGlobal);
        i0 = b_rgb->size[0] * b_rgb->size[1];
        b_rgb->size[0] = 3;
        b_rgb->size[1] = r1->size[1];
        emxEnsureCapacity((emxArray__common *)b_rgb, i0, (int32_T)sizeof(real32_T), &emlrtRTEI);
        i = r1->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            b_rgb->data[b_rgb->size[0] * i0] = I->data[(int32_T)r1->data[r1->size[0] * i0] - 1];
        }
        i = r2->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            b_rgb->data[1 + b_rgb->size[0] * i0] = I->data[(int32_T)(r2->data[r2->size[0] * i0] + (real_T)n) - 1];
        }
        i = r3->size[1] - 1;
        for (i0 = 0; i0 <= i; i0++) {
            b_rgb->data[2 + b_rgb->size[0] * i0] = I->data[(int32_T)(r3->data[r3->size[0] * i0] + (real_T)k) - 1];
        }
        /* 'splx_colors:38' smean(1:3,ii(i)) = sum(rgb,2); */
        EMLRTPUSHRTSTACK(&f_emlrtRSI);
        sum(b_rgb, rgb);
        k = smean->size[1];
        i = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(ii->data[emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, ii->size[1], &cb_emlrtBCI, &emlrtContextGlobal) - 1], &e_emlrtDCI, &emlrtContextGlobal), 1, k, &f_emlrtBCI, &emlrtContextGlobal);
        for (i0 = 0; i0 < 3; i0++) {
            smean->data[i0 + smean->size[0] * (i - 1)] = (real_T)rgb[i0];
        }
        EMLRTPOPRTSTACK(&f_emlrtRSI);
        /* 'splx_colors:39' smean(4,ii(i)) = num; */
        smean->data[3 + smean->size[0] * (emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(ii->data[emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, ii->size[1], &eb_emlrtBCI, &emlrtContextGlobal) - 1], &m_emlrtDCI, &emlrtContextGlobal), 1, smean->size[1], &db_emlrtBCI, &emlrtContextGlobal) - 1)] = (real_T)num;
        /* 'splx_colors:41' ssum2(:,ii(i))=sum(rgb.^2,2); */
        EMLRTPUSHRTSTACK(&g_emlrtRSI);
        EMLRTPUSHRTSTACK(&cb_emlrtRSI);
        for (i0 = 0; i0 < 2; i0++) {
            uv0[i0] = (uint32_T)b_rgb->size[i0];
        }
        i0 = d_y->size[0] * d_y->size[1];
        d_y->size[0] = 3;
        d_y->size[1] = (int32_T)uv0[1];
        emxEnsureCapacity((emxArray__common *)d_y, i0, (int32_T)sizeof(real32_T), &e_emlrtRTEI);
        EMLRTPOPRTSTACK(&cb_emlrtRSI);
        i = 3 * d_y->size[1];
        for (k = 1; k <= i; k++) {
            emlrtDynamicBoundsCheckR2011a(k, 1, 3 * b_rgb->size[1], &m_emlrtBCI, &emlrtContextGlobal);
            d_y->data[emlrtDynamicBoundsCheckR2011a(k, 1, 3 * d_y->size[1], &gb_emlrtBCI, &emlrtContextGlobal) - 1] = muSingleScalarPower(b_rgb->data[k - 1], 2.0F);
        }
        sum(d_y, rgb);
        k = ssum2->size[1];
        i = emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(ii->data[emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, ii->size[1], &fb_emlrtBCI, &emlrtContextGlobal) - 1], &f_emlrtDCI, &emlrtContextGlobal), 1, k, &g_emlrtBCI, &emlrtContextGlobal);
        for (i0 = 0; i0 < 3; i0++) {
            ssum2->data[i0 + ssum2->size[0] * (i - 1)] = (real_T)rgb[i0];
        }
        EMLRTPOPRTSTACK(&g_emlrtRSI);
        b_i++;
        emlrtBreakCheck();
    }
    emxFree_real32_T(&e_I);
    emxFree_real32_T(&d_I);
    emxFree_real32_T(&c_I);
    emxFree_real32_T(&b_I);
    emxFree_real_T(&b_ii2);
    emxFree_real_T(&r6);
    emxFree_int32_T(&r5);
    emxFree_int32_T(&r4);
    emxFree_real32_T(&d_y);
    emxFree_real_T(&r3);
    emxFree_real_T(&r2);
    emxFree_real_T(&r1);
    emxFree_real_T(&ii2);
    emxFree_real32_T(&b_rgb);
    emxFree_boolean_T(&gidx);
    emxInit_boolean_T(&d_smean, 2, &emlrtRTEI, TRUE);
    /* 'splx_colors:44' ii = find(smean(4,:)>1); */
    EMLRTPUSHRTSTACK(&h_emlrtRSI);
    i0 = d_smean->size[0] * d_smean->size[1];
    d_smean->size[0] = 1;
    d_smean->size[1] = smean->size[1];
    emxEnsureCapacity((emxArray__common *)d_smean, i0, (int32_T)sizeof(boolean_T), &emlrtRTEI);
    loop_ub = smean->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        d_smean->data[d_smean->size[0] * i0] = (smean->data[3 + smean->size[0] * i0] > 1.0);
    }
    find(d_smean, ii);
    EMLRTPOPRTSTACK(&h_emlrtRSI);
    /* 'splx_colors:45' n=([1;1;1]*smean(4,ii)); */
    emxFree_boolean_T(&d_smean);
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        emlrtDynamicBoundsCheckR2011a((int32_T)emlrtIntegerCheckR2011a(ii->data[i0], &l_emlrtDCI, &emlrtContextGlobal), 1, smean->size[1], &o_emlrtBCI, &emlrtContextGlobal);
    }
    emxInit_real_T(&e_smean, 2, &emlrtRTEI, TRUE);
    k = ii->size[1];
    i0 = e_smean->size[0] * e_smean->size[1];
    e_smean->size[0] = 1;
    e_smean->size[1] = k;
    emxEnsureCapacity((emxArray__common *)e_smean, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = k - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        e_smean->data[e_smean->size[0] * i0] = smean->data[3 + smean->size[0] * ((int32_T)ii->data[i0] - 1)];
    }
    emxInit_real_T(&b_n, 2, &n_emlrtRTEI, TRUE);
    i0 = b_n->size[0] * b_n->size[1];
    b_n->size[0] = 3;
    b_n->size[1] = e_smean->size[1];
    emxEnsureCapacity((emxArray__common *)b_n, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = e_smean->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            b_n->data[k + b_n->size[0] * i0] = e_smean->data[e_smean->size[0] * i0];
        }
    }
    emxFree_real_T(&e_smean);
    /* 'splx_colors:46' svar(:,ii) = (ssum2(:,ii) - (smean(1:3,ii).^2)./n)./(n - 1); */
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        emlrtDynamicBoundsCheckR2011a((int32_T)ii->data[i0], 1, ssum2->size[1], &p_emlrtBCI, &emlrtContextGlobal);
    }
    EMLRTPUSHRTSTACK(&i_emlrtRSI);
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        emlrtDynamicBoundsCheckR2011a((int32_T)ii->data[i0], 1, smean->size[1], &q_emlrtBCI, &emlrtContextGlobal);
    }
    emxInit_real_T(&f_smean, 2, &emlrtRTEI, TRUE);
    EMLRTPUSHRTSTACK(&db_emlrtRSI);
    k = ii->size[1];
    i0 = f_smean->size[0] * f_smean->size[1];
    f_smean->size[0] = 3;
    f_smean->size[1] = k;
    emxEnsureCapacity((emxArray__common *)f_smean, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = k - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            f_smean->data[k + f_smean->size[0] * i0] = smean->data[k + smean->size[0] * ((int32_T)ii->data[i0] - 1)];
        }
    }
    for (i0 = 0; i0 < 2; i0++) {
        uv0[i0] = (uint32_T)f_smean->size[i0];
    }
    emxFree_real_T(&f_smean);
    emxInit_real_T(&g_y, 2, &emlrtRTEI, TRUE);
    i0 = g_y->size[0] * g_y->size[1];
    g_y->size[0] = 3;
    g_y->size[1] = (int32_T)uv0[1];
    emxEnsureCapacity((emxArray__common *)g_y, i0, (int32_T)sizeof(real_T), &d_emlrtRTEI);
    EMLRTPOPRTSTACK(&db_emlrtRSI);
    loop_ub = emlrtBoundsCheckR2011a(3 * g_y->size[1], &i_emlrtBCI, &emlrtContextGlobal);
    b_i = 1U;
    emxInit_real_T(&g_smean, 2, &emlrtRTEI, TRUE);
    while (b_i <= (uint32_T)loop_ub) {
        c_ii[0] = ii->size[1];
        c_lim = *ii;
        c_lim.size = (int32_T *)&c_ii;
        c_lim.numDimensions = 1;
        emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, 3 * c_lim.size[0], &j_emlrtBCI, &emlrtContextGlobal);
        k = ii->size[1];
        i0 = g_smean->size[0] * g_smean->size[1];
        g_smean->size[0] = 3;
        g_smean->size[1] = k;
        emxEnsureCapacity((emxArray__common *)g_smean, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
        i = k - 1;
        for (i0 = 0; i0 <= i; i0++) {
            for (k = 0; k < 3; k++) {
                g_smean->data[k + g_smean->size[0] * i0] = smean->data[k + smean->size[0] * ((int32_T)ii->data[i0] - 1)];
            }
        }
        g_y->data[emlrtDynamicBoundsCheckR2011a((int32_T)b_i, 1, 3 * g_y->size[1], &u_emlrtBCI, &emlrtContextGlobal) - 1] = muDoubleScalarPower(g_smean->data[(int32_T)b_i - 1], 2.0);
        b_i++;
    }
    emxFree_real_T(&g_smean);
    emxInit_real_T(&h_y, 2, &emlrtRTEI, TRUE);
    i0 = h_y->size[0] * h_y->size[1];
    h_y->size[0] = 3;
    h_y->size[1] = g_y->size[1];
    emxEnsureCapacity((emxArray__common *)h_y, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = g_y->size[0] * g_y->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        h_y->data[i0] = g_y->data[i0];
    }
    emxInit_real_T(&b_ssum2, 2, &emlrtRTEI, TRUE);
    rdivide(h_y, b_n, g_y);
    EMLRTPOPRTSTACK(&i_emlrtRSI);
    k = ii->size[1];
    i0 = b_ssum2->size[0] * b_ssum2->size[1];
    b_ssum2->size[0] = 3;
    b_ssum2->size[1] = k;
    emxEnsureCapacity((emxArray__common *)b_ssum2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    emxFree_real_T(&h_y);
    loop_ub = k - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            b_ssum2->data[k + b_ssum2->size[0] * i0] = ssum2->data[k + ssum2->size[0] * ((int32_T)ii->data[i0] - 1)];
        }
    }
    for (i0 = 0; i0 < 2; i0++) {
        c_ssum2[i0] = b_ssum2->size[i0];
    }
    emxFree_real_T(&b_ssum2);
    emxInit_real_T(&r7, 2, &emlrtRTEI, TRUE);
    emlrtSizeEqCheckNDR2011a(c_ssum2, *(int32_T (*)[2])g_y->size, &g_emlrtECI, &emlrtContextGlobal);
    i0 = r7->size[0] * r7->size[1];
    r7->size[0] = 1;
    r7->size[1] = ii->size[1];
    emxEnsureCapacity((emxArray__common *)r7, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    k = (int32_T)S;
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r7->data[i0] = (real_T)emlrtDynamicBoundsCheckR2011a((int32_T)ii->data[i0], 1, k, &r_emlrtBCI, &emlrtContextGlobal);
    }
    i0 = r0->size[0];
    r0->size[0] = r7->size[1];
    emxEnsureCapacity((emxArray__common *)r0, i0, (int32_T)sizeof(int32_T), &emlrtRTEI);
    loop_ub = r7->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r0->data[i0] = (int32_T)r7->data[i0] - 1;
    }
    emxFree_real_T(&r7);
    emxInit_real_T(&d_ssum2, 2, &emlrtRTEI, TRUE);
    EMLRTPUSHRTSTACK(&j_emlrtRSI);
    k = ii->size[1];
    i0 = d_ssum2->size[0] * d_ssum2->size[1];
    d_ssum2->size[0] = 3;
    d_ssum2->size[1] = k;
    emxEnsureCapacity((emxArray__common *)d_ssum2, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = k - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            d_ssum2->data[k + d_ssum2->size[0] * i0] = ssum2->data[k + ssum2->size[0] * ((int32_T)ii->data[i0] - 1)] - g_y->data[k + g_y->size[0] * i0];
        }
    }
    emxFree_real_T(&ssum2);
    emxInit_real_T(&c_n, 2, &emlrtRTEI, TRUE);
    i0 = c_n->size[0] * c_n->size[1];
    c_n->size[0] = 3;
    c_n->size[1] = b_n->size[1];
    emxEnsureCapacity((emxArray__common *)c_n, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = b_n->size[0] * b_n->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        c_n->data[i0] = b_n->data[i0] - 1.0;
    }
    rdivide(d_ssum2, c_n, g_y);
    EMLRTPOPRTSTACK(&j_emlrtRSI);
    c_ssum2[0] = 3;
    c_ssum2[1] = r0->size[0];
    emlrtSubAssignSizeCheckR2011a(c_ssum2, 2, *(int32_T (*)[2])g_y->size, 2, &i_emlrtECI, &emlrtContextGlobal);
    emxFree_real_T(&c_n);
    emxFree_real_T(&d_ssum2);
    loop_ub = g_y->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            svar->data[k + svar->size[0] * r0->data[i0]] = g_y->data[k + g_y->size[0] * i0];
        }
    }
    emxInit_real_T(&r8, 2, &emlrtRTEI, TRUE);
    /* 'splx_colors:48' smean(1:3,ii) = smean(1:3,ii)./n; */
    i0 = r8->size[0] * r8->size[1];
    r8->size[0] = 1;
    r8->size[1] = ii->size[1];
    emxEnsureCapacity((emxArray__common *)r8, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r8->data[i0] = (real_T)emlrtDynamicBoundsCheckR2011a((int32_T)ii->data[i0], 1, smean->size[1], &s_emlrtBCI, &emlrtContextGlobal);
    }
    i0 = r0->size[0];
    r0->size[0] = r8->size[1];
    emxEnsureCapacity((emxArray__common *)r0, i0, (int32_T)sizeof(int32_T), &emlrtRTEI);
    loop_ub = r8->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r0->data[i0] = (int32_T)r8->data[i0] - 1;
    }
    emxFree_real_T(&r8);
    emxInit_real_T(&h_smean, 2, &emlrtRTEI, TRUE);
    emxInit_real_T(&r9, 2, &emlrtRTEI, TRUE);
    EMLRTPUSHRTSTACK(&k_emlrtRSI);
    i0 = r9->size[0] * r9->size[1];
    r9->size[0] = 1;
    r9->size[1] = ii->size[1];
    emxEnsureCapacity((emxArray__common *)r9, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = ii->size[0] * ii->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r9->data[i0] = (real_T)emlrtDynamicBoundsCheckR2011a((int32_T)ii->data[i0], 1, smean->size[1], &t_emlrtBCI, &emlrtContextGlobal);
    }
    emxFree_real_T(&ii);
    k = r9->size[1];
    i0 = h_smean->size[0] * h_smean->size[1];
    h_smean->size[0] = 3;
    h_smean->size[1] = k;
    emxEnsureCapacity((emxArray__common *)h_smean, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    loop_ub = k - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            h_smean->data[k + h_smean->size[0] * i0] = smean->data[k + smean->size[0] * ((int32_T)r9->data[i0] - 1)];
        }
    }
    emxFree_real_T(&r9);
    rdivide(h_smean, b_n, g_y);
    EMLRTPOPRTSTACK(&k_emlrtRSI);
    c_ssum2[0] = 3;
    c_ssum2[1] = r0->size[0];
    emlrtSubAssignSizeCheckR2011a(c_ssum2, 2, *(int32_T (*)[2])g_y->size, 2, &h_emlrtECI, &emlrtContextGlobal);
    emxFree_real_T(&h_smean);
    emxFree_real_T(&b_n);
    loop_ub = g_y->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            smean->data[k + smean->size[0] * r0->data[i0]] = g_y->data[k + g_y->size[0] * i0];
        }
    }
    emxFree_real_T(&g_y);
    emxFree_int32_T(&r0);
    emxInit_int32_T(&r10, 1, &emlrtRTEI, TRUE);
    /* snorm = sum(smean(1:3,:),1); */
    /* chrom = [smean(1,:);smean(2,:)]./([1;1]*(snorm+eps)); */
    /* 'splx_colors:53' cl = [smean(1:3,:);svar]; */
    i0 = r10->size[0];
    r10->size[0] = smean->size[1];
    emxEnsureCapacity((emxArray__common *)r10, i0, (int32_T)sizeof(int32_T), &emlrtRTEI);
    loop_ub = smean->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        r10->data[i0] = 1 + i0;
    }
    emlrtDimSizeEqCheckR2011a(r10->size[0], svar->size[1], &j_emlrtECI, &emlrtContextGlobal);
    i0 = cl->size[0] * cl->size[1];
    cl->size[0] = 6;
    cl->size[1] = smean->size[1];
    emxEnsureCapacity((emxArray__common *)cl, i0, (int32_T)sizeof(real_T), &emlrtRTEI);
    emxFree_int32_T(&r10);
    loop_ub = smean->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            cl->data[k + cl->size[0] * i0] = smean->data[k + smean->size[0] * i0];
        }
    }
    emxFree_real_T(&smean);
    loop_ub = svar->size[1] - 1;
    for (i0 = 0; i0 <= loop_ub; i0++) {
        for (k = 0; k < 3; k++) {
            cl->data[(k + cl->size[0] * i0) + 3] = svar->data[k + svar->size[0] * i0];
        }
    }
    emxFree_real_T(&svar);
    /* treat differently constant color regions */
    /* detect them as having all 3 channels similar */
    /*   eps = 1e-3; */
    /*   idx = find(sum(abs(smean(1:2,:)-smean(2:3,:)),1)<eps); */
    /*   chrom(:,idx) = chrom(:,idx).*([1;1]*smean(1,idx)); */
    /* gg=ginput(1); lb=lim(round(gg(2)),round(gg(1))); chrom(:,lb), smean(1:3,lb) */
    emlrtHeapReferenceStackLeaveFcn();
}
/* End of code generation (splx_colors.c) */
