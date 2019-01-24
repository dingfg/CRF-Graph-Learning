clc;
clear all;
close all;

img_path = '/home/zhenhua/Desktop/caffe-master/data/mydata/JPEGImages/';
gt_path = '/home/zhenhua/Desktop/caffe-master/data/mydata/SegmentationClass/';
test = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/test.txt';
train = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/train.txt';

addpath('/home/zhenhua/Desktop/rcf-master/matlab');
caffe.set_mode_gpu();

model = '../fcn-8s(7class(have data aug))/val.prototxt';
weights = '../fcn-8s(7class(have data aug))/train_iter_68000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    tline=fgetl(fid);
    imgname = strcat(tline,'.png');
    mat_name_t = [img_path,imgname];
    im = imread(mat_name_t);

    im_data = double(im(:, :, [3, 2, 1]));  
    mean_test = zeros(size(im,1),size(im,2),3);
    mean_test(:,:,1) = 93.096551649791760;
    mean_test(:,:,2) = 94.226183650763790;
    mean_test(:,:,3) = 90.596618285321650;
    im_data = im_data - mean_test;
    im_data = permute(im_data, [2,1,3]);  

    net.blobs('data').reshape([size(im,2),size(im,1),3,1]); 
    net.reshape();
    net.blobs('data').set_data(im_data);
    net.forward_prefilled();
    prob = net.blobs('soft').get_data();
    prob = permute(prob,[2,1,3]);
   
    im_single = single( vl_rgb2xyz(im) );  
    segments = vl_slic(im_single, 15, 0.1) ; 
    
    segments_unique_len = max(segments(:))+1;
    segments_len = length(unique(segments));
    while(segments_unique_len~=segments_len)
        for l=1:segments_unique_len
            if(~sum(any(segments==l)))
                ind = find(segments==segments_unique_len-1);
                segments(ind) = l;              
                break;
            end
        end
        segments_unique_len = max(segments(:))+1;
        segments_len = length(unique(segments));
    end
    
    score_average = zeros(segments_unique_len,size(prob,3));
    HSV_average = zeros(segments_unique_len,3);
    im_hsv = rgb2hsv(im);
    jishu = zeros(1,segments_unique_len);
    
    p = reshape(prob,size(prob,1)*size(prob,2),size(prob,3));
    hsv = reshape(im_hsv,size(im,1)*size(im,2),size(im,3));
    for j = 1:segments_len
        ind = find(segments==j-1);
        jishu(j) = length(ind);
        score_average(j,:) = sum(p(ind,:));
        HSV_average(j,:) = sum(hsv(ind,:));
    end
 
    score_average = bsxfun(@rdivide,score_average,jishu');
    HSV_average = bsxfun(@rdivide,HSV_average,jishu');
    segments = segments + 1; % 0-X  转为 1-(X+1)
    centroid = regionprops(segments,'Centroid');
   
    str = regexp(imgname, '\.', 'split');
    name = str{1};
    save(strcat('dataset(superpixel_unary)/',name),'segments','score_average','HSV_average','centroid');  
    disp(['processing succeed = ',num2str(i)]);
    
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end
end
