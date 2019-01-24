%    image ->  segments/score_average/ hsv_average/centroid

clc;
clear all;
close all;

addpath('/home/ding/Downloads/program/rcf-master/matlab');
caffe.set_mode_gpu();
model = 'heavy-deploy.prototxt';
weights = 'fcn8s-heavy-pascal.caffemodel';
net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

Files = dir(strcat('/home/ding/Desktop/voc/img/','*.jpg')); % trainval picture
LengthFiles = length(Files);

for i = 1:LengthFiles
    tic;
    im = imread(strcat('/home/ding/Desktop/voc/img/',Files(i).name));
   
    im_single = single( vl_rgb2xyz(im) );  
    segments = vl_slic(im_single, 15, 0.1) ; 
    

    im_data = double(im(:, :, [3, 2, 1]));  %matlab按照RGB读取图片，opencv是BGR，所以需要转换顺序为opencv处理格式

    mean_test = zeros(size(im,1),size(im,2),3);
    mean_test(:,:,1) = 104.00698793; %B
    mean_test(:,:,2) = 116.66876762; %G
    mean_test(:,:,3) = 122.67891434; %R
    im_data = im_data - mean_test;
    im_data = permute(im_data, [2,1,3]);
    net.blobs('data').reshape([size(im,2),size(im,1),3,1]); % reshape blob 'data'   原始 500*500*3*1
    net.reshape();
    net.blobs('data').set_data(im_data);
    net.forward_prefilled();
    prob = net.blobs('soft').get_data();
    prob = permute(prob,[2,1,3]);
    
    %这里只是处理超像素序号有跳跃的情况
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
   
    str = regexp(Files(i).name, '\.', 'split');
    name = str{1};
    save(strcat('dataset(img_process)/',name),'segments','score_average','HSV_average','centroid');  
    disp(['processing succeed = ',num2str(i)]);
    toc
end
