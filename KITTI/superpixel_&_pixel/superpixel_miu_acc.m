clc;
clear all;
close all;

superpixel = 'dataset(superpixel_unary)/';
gt_path = '/home/zhenhua/Desktop/caffe-master/data/mydata/SegmentationClass/';
test = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/test.txt';
train = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/train.txt';
% fid = fopen(train);
fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    imgname = strcat(tline,'.png');
    matname = strcat(tline,'.mat');
    
    data = load([superpixel matname]);
    
    [~,prob] = max(data.score_average');
    pro = zeros(size(data.segments));
    for j = 1:size(data.score_average,1)
        ins = find(data.segments == j);
        pro(ins) = prob(j);
    end
    
% map2 = [0 0 1;   % Object:Car               0
%     1 0 0;      % Road:Road                   1
%     0 1 0;      % Building:Building            2
%     0 1 1;      % Tree/Bush:Tree/Bush     3
%     1 0 0.6;    % Sign/Pole:Pole              4
% %     1 0.6 0;    % Sky:Sky                      5
%     0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
% %     0 0 0;      % Void:Void                     7
%     ];
% figure
% imagesc(pro)
% colormap(map2)
% saveas(gcf,'0.png');

    gt_name_t = [gt_path,imgname];
    gt = imread(gt_name_t);
    gt = gt + 1;
    
    index_void = find(gt==8);
    pro(index_void)=8;
       
    
    confusion_mat=confusionmat(double(gt(:)),pro(:),'order',1:8);
    confusion_mat=confusion_mat(1:7,1:7);
    
    if ~exist('confusionMatrix','var')    % confusionMatrix中的变量是否存在，这个只在第1图像使用        
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat; % 把每张图像得到的confusion_mat加起   
    end
    
    i = i + 1;
    toc
end

m = zeros(7,1);
for i = 1:7
    if(( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) )~=0)
        m(i) = confusionMatrix(i,i) / ( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) );
    else
        m(i)=1;
    end
end
mean_IU = mean(m);          

pixel_acc = sum(sum(eye(7).* confusionMatrix)) / sum(sum(confusionMatrix));  

p = zeros(7,1);
for i = 1:7
        p(i) = confusionMatrix(i,i) / ( sum(confusionMatrix(i,:)) );
end
mean_p = mean(p);


% test = imread('/home/zhenhua/Desktop/caffe-master/data/mydata/JPEGImages/00_002000.png');
% data = load('dataset(superpixel_unary)/00_002000.mat');
% [sx,sy]=vl_grad(double(data.segments), 'type', 'forward') ;  % 梯度
% s = find(sx | sy) ;  
% imp = test;  
% imp([s s+numel(test(:,:,1)) s+2*numel(test(:,:,1))]) = 255;
% %imp(s+2*numel(test(:,:,1))) = 255;
% imshow(imp)


% pixel : test 0.609752203930203 0.863834088879313
% super :test 0.610119318294244 0.870349923578358