/*
 * splx_colors_api.c
 *
 * Code generation for function 'splx_colors_api'
 *
 * C source code generated on: Tue Aug 20 10:23:24 2013
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "splx_colors.h"
#include "splx_colors_api.h"
#include "splx_colors_emxutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRTEInfo w_emlrtRTEI = { 1, 1, "splx_colors_api", "" };

/* Function Declarations */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier *parentId, emxArray_real_T *y);
static void c_emlrt_marshallIn(const mxArray *I, const char_T *identifier, emxArray_real32_T *y);
static void d_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier *parentId, emxArray_real32_T *y);
static void e_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier *msgId, emxArray_real_T *ret);
static void emlrt_marshallIn(const mxArray *lim, const char_T *identifier, emxArray_real_T *y);
static const mxArray *emlrt_marshallOut(emxArray_real_T *u);
static void f_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier *msgId, emxArray_real32_T *ret);

/* Function Definitions */

static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier *parentId, emxArray_real_T *y)
{
    e_emlrt_marshallIn(emlrtAlias(u), parentId, y);
    emlrtDestroyArray(&u);
}

static void c_emlrt_marshallIn(const mxArray *I, const char_T *identifier, emxArray_real32_T *y)
{
    emlrtMsgIdentifier thisId;
    thisId.fIdentifier = identifier;
    thisId.fParent = NULL;
    d_emlrt_marshallIn(emlrtAlias(I), &thisId, y);
    emlrtDestroyArray(&I);
}

static void d_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier *parentId, emxArray_real32_T *y)
{
    f_emlrt_marshallIn(emlrtAlias(u), parentId, y);
    emlrtDestroyArray(&u);
}

static void e_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier *msgId, emxArray_real_T *ret)
{
    int32_T i4;
    int32_T iv4[2];
    boolean_T bv0[2];
    for (i4 = 0; i4 < 2; i4++) {
        iv4[i4] = 480 + 1520 * i4;
        bv0[i4] = TRUE;
    }
    emlrtCheckVsBuiltInR2011a(msgId, src, "double", FALSE, 2U, iv4, bv0, ret->size);
    i4 = ret->size[0] * ret->size[1];
    emxEnsureCapacity((emxArray__common *)ret, i4, (int32_T)sizeof(real_T), (emlrtRTEInfo *)NULL);
    emlrtImportArrayR2008b(src, ret->data, 8);
    emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const mxArray *lim, const char_T *identifier, emxArray_real_T *y)
{
    emlrtMsgIdentifier thisId;
    thisId.fIdentifier = identifier;
    thisId.fParent = NULL;
    b_emlrt_marshallIn(emlrtAlias(lim), &thisId, y);
    emlrtDestroyArray(&lim);
}

static const mxArray *emlrt_marshallOut(emxArray_real_T *u)
{
    const mxArray *y;
    const mxArray *m1;
    real_T (*pData)[];
    int32_T i3;
    int32_T i;
    int32_T b_i;
    y = NULL;
    m1 = mxCreateNumericArray(2, u->size, mxDOUBLE_CLASS, mxREAL);
    pData = (real_T (*)[])mxGetPr(m1);
    i3 = 0;
    for (i = 0; i < u->size[1]; i++) {
        for (b_i = 0; b_i < 6; b_i++) {
            (*pData)[i3] = u->data[b_i + u->size[0] * i];
            i3++;
        }
    }
    emlrtAssign(&y, m1);
    return y;
}

static void f_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier *msgId, emxArray_real32_T *ret)
{
    int32_T i;
    static const int16_T iv5[3] = { 480, 2000, 3 };
    int32_T iv6[3];
    static const boolean_T bv1[3] = { TRUE, TRUE, FALSE };
    boolean_T bv2[3];
    for (i = 0; i < 3; i++) {
        iv6[i] = iv5[i];
        bv2[i] = bv1[i];
    }
    emlrtCheckVsBuiltInR2011a(msgId, src, "single", FALSE, 3U, iv6, bv2, ret->size);
    i = ret->size[0] * ret->size[1] * ret->size[2];
    ret->size[2] = 3;
    emxEnsureCapacity((emxArray__common *)ret, i, (int32_T)sizeof(real32_T), (emlrtRTEInfo *)NULL);
    emlrtImportArrayR2008b(src, ret->data, 4);
    emlrtDestroyArray(&src);
}

void splx_colors_api(const mxArray * const prhs[2], const mxArray *plhs[1])
{
    emxArray_real_T *lim;
    emxArray_real32_T *I;
    emxArray_real_T *cl;
    emlrtHeapReferenceStackEnterFcn();
    emxInit_real_T(&lim, 2, &w_emlrtRTEI, TRUE);
    b_emxInit_real32_T(&I, 3, &w_emlrtRTEI, TRUE);
    emxInit_real_T(&cl, 2, &w_emlrtRTEI, TRUE);
    /* Marshall function inputs */
    emlrt_marshallIn(emlrtAliasP(prhs[0]), "lim", lim);
    c_emlrt_marshallIn(emlrtAliasP(prhs[1]), "I", I);
    /* Invoke the target function */
    splx_colors(lim, I, cl);
    /* Marshall function outputs */
    plhs[0] = emlrt_marshallOut(cl);
    emxFree_real_T(&cl);
    emxFree_real32_T(&I);
    emxFree_real_T(&lim);
    emlrtHeapReferenceStackLeaveFcn();
}
/* End of code generation (splx_colors_api.c) */
