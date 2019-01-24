function output=spxls_colors(SPixels,I)

% SPixels : Superpixel oversegmentation of the original image
% I : same size than SPixels, color space, RGB or LAB
%
% output = [6 x Ns], Ns=number of superpixels, 1:3 mean for each spixels
% in each color channel, 4:6 variance.

if exist('splx_colors_mex','file')==3      % 3 if 文件 is a MEX-file on MATLAB's search path
                                           % 在/home/ding/Desktop/seg/SemMap/Research/code/codegenMatlab/codegen/mex/splx_colors/下
    %splx_colors mex version compiled for double(:480 x :2000) and single(:480 x :2000 x 3)
    output = splx_colors_mex(double(SPixels),single(I));
else
    output = splx_colors(SPixels,I); %#codegen
end
