clc;
clear all;
close all;

img_path = '/home/zhenhua/Desktop/caffe-master/data/mydata/JPEGImages/';
gt_path = '/home/zhenhua/Desktop/caffe-master/data/mydata/SegmentationClass/';
all = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/all.txt';
im_data = zeros(1,3);
num = 0;

fid = fopen(all);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    imgname = strcat(tline,'.png');
    mat_name_t = [img_path,imgname];
    im = imread(mat_name_t);

%     im_data = double(im(:, :, [3, 2, 1]));  
%     mean_test = zeros(size(im,1),size(im,2),3);
%     mean_test(:,:,1) = 104.00698793;
%     mean_test(:,:,2) = 116.66876762;
%     mean_test(:,:,3) = 122.67891434;

    im_data = im_data + sum(reshape(im,[],3));
    num = num + size(im,1)*size(im,2);
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end

end

im_mean_data = im_data / num;   % [90.596618285321650,94.226183650763790,93.096551649791760]