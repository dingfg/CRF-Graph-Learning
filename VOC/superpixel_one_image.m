%    image ->  segments/score_average/ hsv_average/centroid

run('/home/zhenhua/CV/sseg/vlfeat-0.9.15/toolbox/vl_setup')

clc;
clear all;

%     tline='2007_000129';
%     tline='2007_006678';
%     tline='2007_005173';
    tline='2007_005331';
    
    matname = strcat(tline,'.mat');
   
    im = imread(strcat('img/',strcat(tline,'.jpg')));
    
    im_single = single( vl_rgb2xyz(im) );  
    segments = vl_slic(im_single, 20, 0.03) ;
    
    test = imread('img/2007_005331.jpg');
    [sx,sy]=vl_grad(double(segments), 'type', 'forward') ;  % 梯度
    s = find(sx | sy) ;  
    imp = test;  
    imp([s s+numel(test(:,:,1)) s+2*numel(test(:,:,1))]) = 255;
    %imp(s+2*numel(test(:,:,1))) = 255;
    imshow(imp)
    


