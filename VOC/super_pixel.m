
clear all
close all
clear classes 

gt_path = 'SegmentationClass/';
unary = 'unary(refinenet)/';

val = 'txt_file/val.txt';
fid = fopen(val);

i=1;
while ~feof(fid)
    tic;
    fprintf('processing %d\n',i);
    tline=fgetl(fid);%tline='2007_000129';
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
    index_void = find(gt_pixels_label==255);
    gt_pixels_label(index_void) = 22;  
    
    data = load(strcat(unary,tline));
    [a,optimalDecoding]=max(data.score_average,[],2);% test superpixels mean_IU
    
    infer_label = zeros(size(gt));
    for j=1:size(data.centroid,1)
        ins = find(data.segments==j);
        infer_label(ins) = optimalDecoding(j);
    end
    
    infer_label(index_void) = 22;
    
    confusion_mat=confusionmat(double(gt_pixels_label(:)),double(infer_label(:)),'order',1:22);
    confusion_mat=confusion_mat(1:21,1:21);
    
    if ~exist('confusionMatrix','var')    % confusionMatrix中的变量是否存在，这个只在第1图像使用        
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat; % 把每张图像得到的confusion_mat加起   
    end
    
    i=i+1;
    toc
end

s = 0;k=0;m = zeros(21,1);
for i = 1:21
    if(( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) )~=0)
        m(i) = confusionMatrix(i,i) / ( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) );
    else
        m(i)=1;
    end
end
mean_IU = mean(m);

pixel_acc = sum(sum(eye(21).* confusionMatrix)) / sum(sum(confusionMatrix));