clc
close all
clear classes 

addpath(genpath('/home/zhenhua/CV/sseg/vlfeat-0.9.15/'));

origin_path = '../../../VOC/unary(refinenet)/';
gt_path = '../../../VOC/SegmentationClass/';
img_path = '../../../VOC/img/';

% train = '../VOC/txt_file/train.txt';
% fid = fopen(train);
val = '../../../VOC/txt_file/val.txt';
fid = fopen(val);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);%
%     tline='2007_000129';
    
    matname = strcat(tline,'.mat');
    mat_name_t = [origin_path,matname];
    Im_after_fcn8 = load(mat_name_t);
    
    segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
    centroid = struct2cell(Im_after_fcn8.centroid);
    centroid = reshape(cell2mat(centroid),2,[]);       % 2 * Ns double
    HSV_average = Im_after_fcn8.HSV_average;           % Ns * 3 double
    score_average = Im_after_fcn8.score_average;       % Ns * 21 double
    Ns = max(max(segment));
    
    % ground truth
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
    index_void = find(gt_pixels_label==255);
    gt_pixels_label(index_void) = 22;          % 255 -> 22 (22: void) 
    

    left = load(strcat('./infer_trainval/infer_left/',matname));
    top = load(strcat('./infer_trainval/infer_top/',matname));
    ul = load(strcat('./infer_trainval/infer_ul/',matname));
    ur = load(strcat('./infer_trainval/infer_ur/',matname));  
    
    theta = 0.90;

    [r,c,r_s,c_s,gt_super_label,flag] = edge_and_gtlabel_1102(double(segment),gt_pixels_label,left.prob,top.prob,ul.prob,ur.prob,Ns,theta);
    
    num_edges = length(r_s);
    gt_edge_label = zeros(1,num_edges);
    infer_edge_label = zeros(1,num_edges);
    edge = [c,r];
    edge_set = [c_s,r_s];
    
    for j = 1:num_edges
        s3 = (gt_super_label(c_s(j))==gt_super_label(r_s(j)));
        if s3==1
            gt_edge_label(j) = 1;
        end
        if ismember(edge_set(j,:),edge,'rows')==1
            infer_edge_label(j) = 1;
        end
    end
    
    confusion_mat=confusionmat(gt_edge_label,infer_edge_label);
    
    if ~exist('confusionMatrix','var')          
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat;    
    end
    
    toc
    i = i + 1;
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

% a = [270843,20172;829242,2371067];
% b = sum(a,2);
% c = repmat(b,1,2);
% m = a ./ c;
%[0.930683985361579,0.069316014638421;
% 0.259113104390857,0.740886895609143]


