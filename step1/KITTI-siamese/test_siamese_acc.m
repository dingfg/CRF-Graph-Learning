clc
close all
clear classes 

addpath('/home/zhenhua/dfg_code/caffe/matlab');
caffe.set_mode_gpu();
model = 'img_siamese2.prototxt';
weights = 'img_siamese_iter_50000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

% test = './test.txt';
test = './data_test.txt';
fid = fopen(test);
confusionMatrix = zeros(2,2);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    S = regexp(tline, '\t', 'split');
    img1 = imread(S{1});
    img2 = imread(S{2});
    gt_label = str2num(S{3});
    
    im1_data = double(img1(:, :, [3, 2, 1]));
    im2_data = double(img2(:, :, [3, 2, 1]));
    im_data = cat(3,im1_data,im2_data);
    im_data = permute(im_data, [2,1,3]);
    im_data = im_data * 0.00390625;
    
    net.blobs('pair_data').reshape([size(img1,2),size(img1,1),6,1]); % reshape blob 'data'   原始 500*500*3*1
    net.reshape();
    net.blobs('pair_data').set_data(im_data);
    net.forward_prefilled();
    prob = net.blobs('prob').get_data();
    
    [C,I] = max(prob);
    
    confusionMatrix(gt_label+1,I) = confusionMatrix(gt_label+1,I) + 1;
    
    toc
    i = i + 1;
%     if i>100
%         break
%     end
end
% accuracy = (confusionMatrix(1,1)+confusionMatrix(2,2)) / sum(sum(confusionMatrix));
m = zeros(2,1);
for i = 1:2
    if(( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) )~=0)
        m(i) = confusionMatrix(i,i) / ( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) );
    else
        m(i)=1;
    end
end
mean_IU = mean(m);

% 50000.caffemodel
% a = [46386,16160;100685,369732];
% b = sum(a,2);
% c = repmat(b,1,2);
% m = a ./ c;
% [0.741630160202091,0.258369839797909;
%  0.214033506442157,0.785966493557843]
% mean_IU: 0.522018625966949





% 500000.caffemodel
% [34310,15690;10760,39240]
% [0.686200000000000,0.313800000000000;
%  0.215200000000000,0.784800000000000]
% mean_IU: 0.581015953000463

% 50000.caffemodel
% [37086,12914;10710,39290]
% [0.741720000000000,0.258280000000000;
%  0.214200000000000,0.785800000000000]
% mean_IU: 0.617687322915390


