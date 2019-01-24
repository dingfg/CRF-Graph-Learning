clear all
close all
clear classes 

gt_path = 'SegmentationClass/';
a08 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/0.8/predict_result_full/';
b10 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/1.0/predict_result_full/';
c06 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/0.6/predict_result_full/';

val = 'txt_file/val.txt';
fid = fopen(val);

i=1;
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
%     tline='2007_000129';
    matname = strcat(tline,'.mat');
    
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
    index_void = find(gt_pixels_label==255);
    gt_pixels_label(index_void) = 22;  
    
    m1 = load(strcat(a08,matname));
    m2 = load(strcat(b10,matname));
    m3 = load(strcat(c06,matname));
    
    m1 = single(gather(m1.data_obj.score_map))/255;
    m2 = single(gather(m2.data_obj.score_map))/255;
    m3 = single(gather(m3.data_obj.score_map))/255;
    
    a = zeros(size(gt,1),size(gt,2),21);
    b = zeros(size(gt,1),size(gt,2),21);
    c = zeros(size(gt,1),size(gt,2),21);
    for j =1:21
        a(:,:,j) =  imresize(m1(:,:,j),size(gt),'bilinear');
        b(:,:,j) =  imresize(m2(:,:,j),size(gt),'bilinear');
        c(:,:,j) =  imresize(m3(:,:,j),size(gt),'bilinear');
    end
    m = (a+b+c)/3;
    [~,label] = max(m,[],3);
    label(index_void)=22;
    
%     data=single(zeros(500,500,21));
%     m=single(permute(m,[2,1,3]));
%     data(1:size(m,1),1:size(m,2),1:21) = m;
%     save(strcat('pixel_unary/',strcat(tline,'_blob_0')),'data');  
    
    
    
    confusion_mat=confusionmat(double(gt_pixels_label(:)),label(:),'order',1:22);
    confusion_mat=confusion_mat(1:21,1:21);
    
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


s = 0;k=0;m = zeros(21,1);
for i = 1:21
    if(( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) )~=0)
        m(i) = confusionMatrix(i,i) / ( sum(confusionMatrix(i,:)) + sum(confusionMatrix(:,i)) - confusionMatrix(i,i) );
    else
        m(i)=1;
    end
end
mean_IU = mean(m);  % 0.816603329985669

pixel_acc = sum(sum(eye(21).* confusionMatrix)) / sum(sum(confusionMatrix));    % 0.960968138032822