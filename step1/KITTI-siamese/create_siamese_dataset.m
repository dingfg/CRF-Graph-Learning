clc
close all
clear classes 

origin_path = '../../KITTI/superpixel_&_pixel/dataset(superpixel_unary)/';
gt_path = '../../KITTI/SegmentationClass/';
img_path = '../../KITTI/JPEGImages/';

train = '../../KITTI/train.txt';
fid = fopen(train);
% val = '../../KITTI/test.txt';
% fid = fopen(val);

% fid2 = fopen('data1_train.txt','w');
% fid3 = fopen('data0_train.txt','w');
% fid4 = fopen('data_train.txt','w');

% tic
i=1; 
while ~feof(fid)
    tic
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);%
%     tline='2007_000129';
%     tline='2007_006678';
%     tline='2007_005173';
%     tline='2007_005331';
%     tline = '2007_003778';% 500*500
    
    matname = strcat(tline,'.mat');
    mat_name_t = [origin_path,matname];
    Im_after_fcn8 = load(mat_name_t);
    
    segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
    Ns = max(max(segment));
    
    % ground truth
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
    index_void = find(gt_pixels_label==255);
    gt_pixels_label(index_void) = 22;          % 255 -> 22 (22: void) 

    [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_0720_adjacent(double(segment),gt_pixels_label,Ns);
    
    num_edges = length(r);
    temp = zeros(4,Ns);
    for j = 1:size(segment,1)
        uni = unique(segment(j,:));
        for k = 1:length(uni)
            if temp(1,uni(k))==0
                temp(1,uni(k)) = j;
            end
        end
    end
    for j = size(segment,1):-1:1
        uni = unique(segment(j,:));
        for k = 1:length(uni)
            if temp(2,uni(k))==0
                temp(2,uni(k)) = j;
            end
        end
    end
    for j = 1:size(segment,2)
        uni = unique(segment(:,j));
        for k = 1:length(uni)
            if temp(3,uni(k))==0
                temp(3,uni(k)) = j;
            end
        end
    end
    for j = size(segment,2):-1:1
        uni = unique(segment(:,j));
        for k = 1:length(uni)
            if temp(4,uni(k))==0
                temp(4,uni(k)) = j;
            end
        end
    end
    
    im = imread([img_path tline '.png']);
    for j = 1:Ns     
        data = im(temp(1,j):temp(2,j),temp(3,j):temp(4,j),:);
        data = imresize(data,[28,28]);
        imwrite(data,['./siamese_img_train/' tline '_' num2str(j) '.png']);
    end
    
%     for j = 1:num_edges
%         s1 = ['siamese_img_test/' tline '_' num2str(c(j)) '.png'];
%         s2 = ['siamese_img_test/' tline '_' num2str(r(j)) '.png'];
%         s3 = (gt_super_label(c(j))==gt_super_label(r(j)));
%         if s3==1
%             fprintf(fid2,[s1 '\t' s2 '\t' num2str(s3) '\n']); 
%         else
%             fprintf(fid3,[s1 '\t' s2 '\t' num2str(s3) '\n']); 
%         end
%         fprintf(fid4,[s1 '\t' s2 '\t' num2str(s3) '\n']);
%     end

    toc
    i = i+1;
%     if i>1
%         break;
%     end
end
% toc
fclose(fid);
% fclose(fid2);
% fclose(fid3);
% fclose(fid4);


%%
clc
close all
clear classes 

origin_path = '../../KITTI/superpixel_&_pixel/dataset(superpixel_unary)/';
gt_path = '../../KITTI/SegmentationClass/';
img_path = '../../KITTI/JPEGImages/';

% train = '../../KITTI/train.txt';
% fid = fopen(train);
val = '../../KITTI/test.txt';
fid = fopen(val);

% fid2 = fopen('data1_train.txt','w');
% fid3 = fopen('data0_train.txt','w');
% fid4 = fopen('data_train.txt','w');

% tic
i=1; 
while ~feof(fid)
    tic
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);%
%     tline='2007_000129';
%     tline='2007_006678';
%     tline='2007_005173';
%     tline='2007_005331';
%     tline = '2007_003778';% 500*500
    
    matname = strcat(tline,'.mat');
    mat_name_t = [origin_path,matname];
    Im_after_fcn8 = load(mat_name_t);
    
    segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
    Ns = max(max(segment));
    
    % ground truth
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
    index_void = find(gt_pixels_label==255);
    gt_pixels_label(index_void) = 22;          % 255 -> 22 (22: void) 

    [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_0720_adjacent(double(segment),gt_pixels_label,Ns);
    
    num_edges = length(r);
    temp = zeros(4,Ns);
    for j = 1:size(segment,1)
        uni = unique(segment(j,:));
        for k = 1:length(uni)
            if temp(1,uni(k))==0
                temp(1,uni(k)) = j;
            end
        end
    end
    for j = size(segment,1):-1:1
        uni = unique(segment(j,:));
        for k = 1:length(uni)
            if temp(2,uni(k))==0
                temp(2,uni(k)) = j;
            end
        end
    end
    for j = 1:size(segment,2)
        uni = unique(segment(:,j));
        for k = 1:length(uni)
            if temp(3,uni(k))==0
                temp(3,uni(k)) = j;
            end
        end
    end
    for j = size(segment,2):-1:1
        uni = unique(segment(:,j));
        for k = 1:length(uni)
            if temp(4,uni(k))==0
                temp(4,uni(k)) = j;
            end
        end
    end
    
    im = imread([img_path tline '.png']);
    for j = 1:Ns     
        data = im(temp(1,j):temp(2,j),temp(3,j):temp(4,j),:);
        data = imresize(data,[28,28]);
        imwrite(data,['./siamese_img_test/' tline '_' num2str(j) '.png']);
    end
    
%     for j = 1:num_edges
%         s1 = ['siamese_img_test/' tline '_' num2str(c(j)) '.png'];
%         s2 = ['siamese_img_test/' tline '_' num2str(r(j)) '.png'];
%         s3 = (gt_super_label(c(j))==gt_super_label(r(j)));
%         if s3==1
%             fprintf(fid2,[s1 '\t' s2 '\t' num2str(s3) '\n']); 
%         else
%             fprintf(fid3,[s1 '\t' s2 '\t' num2str(s3) '\n']); 
%         end
%         fprintf(fid4,[s1 '\t' s2 '\t' num2str(s3) '\n']);
%     end

    toc
    i = i+1;
%     if i>1
%         break;
%     end
end
% toc
fclose(fid);
% fclose(fid2);
% fclose(fid3);
% fclose(fid4);