clc;
clear all;
close all;

img_path = '/home/zhenhua/Desktop/dfg_code/rcf-master/data/train_rcf/JPEGImages/';
train = 'train.txt';
test = 'test.txt';

addpath('/home/zhenhua/Desktop/dfg_code/rcf-master/matlab');
caffe.set_mode_gpu();

model = 'test.prototxt';
% weights = 'rcf_left_iter_18000.caffemodel';
% weights = 'rcf_top_iter_18000.caffemodel';
% weights = 'rcf_ul_iter_16000.caffemodel';
% weights = 'rcf_ur_iter_16000.caffemodel';
weights = 'rcf_pretrained_bsds.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

fid = fopen(train);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
%     tline=fgetl(fid);%tline = '00_002000';
%     imgname = strcat(tline,'.png');
%     mat_name_t = [img_path,imgname];
%     im = imread(mat_name_t);
    im = imread('hznzw0_313700_10.jpg');


    im_data = double(im(:, :, [3, 2, 1]));  

    mean_test = zeros(size(im,1),size(im,2),3);
    mean_test(:,:,1) = 104.00698793;
    mean_test(:,:,2) = 116.66876762;
    mean_test(:,:,3) = 122.67891434;

    im_data = im_data - mean_test;

    im_data = permute(im_data, [2,1,3]);  

    net.blobs('data').reshape([size(im,2),size(im,1),3,1]); % reshape blob 'data'   原始 500*500*3*1
    net.reshape();

    net.blobs('data').set_data(im_data);
    net.forward_prefilled();
    
    prob = net.blobs('sigmoid-fuse').get_data();

%      imshow(prob');
%     set(gcf,'Position',[0,0,size(im,2),size(im,1)]);
%     set(gca, 'position', [0 0 1 1 ]); 
     
    prob = transpose(1-prob);
%     figure('name','side output fuse');
%    
   
    
    save(strcat('rcf_infer/infer_ur/',tline),'prob');
    
%     save('ur','prob');
    
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end

end

set(gcf,'Position',[0,0,size(im,2),size(im,1)]);
set(gca, 'position', [0 0 1 1 ]); 
% %print('-f1', '-r300', '-dpng','xxx.png'); % set the DPI




% l = load('rcf_infer/infer_left/00_002000.mat');
% t = load('rcf_infer/infer_top/00_002000.mat');
% ull = load('rcf_infer/infer_ul/00_002000.mat');
% urr = load('rcf_infer/infer_ur/00_002000.mat');
% % graph=  l.prob + t.prob + ull.prob + urr.prob;
% % graph=graph./4;
% figure('name','left');
% imshow(l.prob);
% figure('name','top');
% imshow(t.prob);
% figure('name','ul');
% imshow(ull.prob);
% figure('name','ur');
% imshow(urr.prob);
% 
% graph = zeros(size(l.prob,1),size(l.prob,2),4);
% graph(:,:,1) = l.prob;
% graph(:,:,2) = t.prob;
% graph(:,:,3) = ull.prob;
% graph(:,:,4) = urr.prob;
% [a,b] = min(graph,[],3);
% figure('name','fuse');
% imshow(a);
