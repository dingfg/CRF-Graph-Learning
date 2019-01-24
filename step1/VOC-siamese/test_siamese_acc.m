clc
close all
clear classes 

addpath('/home/zhenhua/dfg_code/caffe/matlab');
caffe.set_mode_gpu();
model = 'img_siamese2.prototxt';
weights = 'img_siamese_iter_500000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

% val = './val.txt';
% fid = fopen(val);
% test = './data_val.txt';
% fid = fopen(test);
test = './test.txt';
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
% [40663,9337;13362,36638]
% [0.813260000000000,0.186740000000000;
%  0.267240000000000,0.732760000000000]
% mean_IU: 0.629606556801212


% 500000.caffemodel
% [36195,13805;13853,36147]
% [0.723900000000000,0.276100000000000;
%  0.277060000000000,0.722940000000000]
% mean_IU: 0.566685927865478



%%
%　model 500000
% 0.721884305209141
% a = [210989,80026;890966,2309343];
% b = sum(a,2);
% c = repmat(b,1,2);
% acc = a ./ c;
%[0.725010738278096,0.274989261721904;
% 0.278399992000772,0.721600007999228]

% model 50000 *************************************
% [0.738231971595876]
% a = [236777,54238;859679,2340630];
% b = sum(a,2);
% c = repmat(b,1,2);
% acc = a ./ c;
%[0.813624727247736,0.186375272752264;
% 0.268623748519284,0.731376251480716]



