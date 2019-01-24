clc;
clear all;
close all;

img_path = '/home/zhenhua/Desktop/dfg_code/caffe-master/data/mydata/JPEGImages/';
gt_path = '/home/zhenhua/Desktop/dfg_code/caffe-master/data/mydata/SegmentationClass/';
% test = '/home/zhenhua/Desktop/rcf-master/data/mydata/ImageSets/Segmentation/old/test.txt';
% val = '/home/zhenhua/Desktop/rcf-master/data/mydata/ImageSets/Segmentation/old/val.txt';
% train = '/home/zhenhua/Desktop/rcf-master/data/mydata/ImageSets/Segmentation/old/train.txt';
test = '/home/zhenhua/Desktop/dfg_code/caffe-master/data/mydata/ImageSets/Segmentation/test.txt';
train = '/home/zhenhua/Desktop/dfg_code/caffe-master/data/mydata/ImageSets/Segmentation/train.txt';

addpath('/home/zhenhua/Desktop/dfg_code/rcf-master/matlab');
caffe.set_mode_gpu();

model = 'fcn-8s(7class(have data aug))/val.prototxt';
weights = 'fcn-8s(7class(have data aug))/train_iter_68000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;

fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    imgname = strcat(tline,'.png');
    mat_name_t = [img_path,imgname];
    im = imread(mat_name_t);

    im_data = double(im(:, :, [3, 2, 1]));  

    mean_test = zeros(size(im,1),size(im,2),3);
%     mean_test(:,:,1) = 104.00698793;
%     mean_test(:,:,2) = 116.66876762;
%     mean_test(:,:,3) = 122.67891434;
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

    [~,b] = max(prob,[],3);
    pro = transpose(b-1);
    
% map = [0 0 1;   % Object:Car
%         1 0 0;      % Road:Road
%         0 1 0;      % Building:Building
%         0 1 1;      % Tree/Bush:Tree/Bush
%         1 0 0.6;    % Sign/Pole:Pole
%         1 0.6 0;    % Sky:Sky
%         0 0.6 0.6;  % Grass/Dirt:Grass/Dirt
%         0.6 0.6 0.6;% Side rail:Side rail
%         1 1 0.6;    % Bicycle/Motorbike:Bicycle/Motorbike
%          0 0 0;      % Void:Void
% %         0 0.6 1;    % Object:Person
% %         0 0 0.6;    % Object:Object
% %         1 1 0;      % Road:Mark
% %         1 0 1;      % Road:Sidewalk
% %         0 1 0.6;    % Road:Curb
% %         0.6 1 0;    % Building:Wall
% %         0.6 0 1;    % Sign/Pole:Sign
%         ];

%     map = [0 0 1;   % Object:Car               0
%         1 0 0;      % Road:Road                   1
%         0 1 0;      % Building:Building            2
%         0 1 1;      % Tree/Bush:Tree/Bush     3
%         1 0 0.6;    % Sign/Pole:Pole              4
%         1 0.6 0;    % Sky:Sky                      5
%         0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
%         ];
%     figure(1)
%     imagesc(pro)
%     colormap(map)
% 
%     
%     map = [0 0 1;   % Object:Car               0
%         1 0 0;      % Road:Road                   1
%         0 1 0;      % Building:Building            2
%         0 1 1;      % Tree/Bush:Tree/Bush     3
%         1 0 0.6;    % Sign/Pole:Pole              4
%         1 0.6 0;    % Sky:Sky                      5
%         0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
%         0 0 0;      % Void:Void                     7
%         ];   
% %     aaa = imread(['/home/zhenhua/Desktop/caffe-master/data/mydata/SegmentationClass/' imgname]);
%     figure(2)
%     imagesc(aaa)
%     colormap(map)
%     saveas(gcf,'0.png');
    
    gt_name_t = [gt_path,imgname];
    gt = imread(gt_name_t);
    
    index_void = find(gt==7);
    pro(index_void)=7;
    
    confusion_mat=confusionmat(double(gt(:)),pro(:),'order',0:7);
    confusion_mat=confusion_mat(1:7,1:7);
    
    if ~exist('confusionMatrix','var')    % confusionMatrix中的变量是否存在，这个只在第1图像使用        
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat; % 把每张图像得到的confusion_mat加起   
    end
    
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end

end


s = 0;k=0;m = zeros(7,1);
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


% test: 0.548842944377077  0.864614375215150
% train: 0.599220581493013 0.880422364035185

% fcn-8s(9class)
% test 0.549826111010962 0.864798335169404
% val  0.510039024967258 0.854154421501643
% train 0.601866486028453 0.881934294192997

% fcn-8s(7class) 
% train 0.679112397559868 0.891197780344298
% test 0.609752203930203 0.863834088879313

% fcn-8s(7class have data aug)
% test 0.607845539524275 0.864685747894882
% [0.643345929935655;0.958921541336939;0.901439072367740;0.841370432716111;0.194731890874882;0.641600703605981;0.624259005927953]
% train 0.665780034891520 0.887204311125352