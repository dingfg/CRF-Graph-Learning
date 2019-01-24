% clc
% close all
% clear classes 
% 
% 
% addpath('/home/zhenhua/dfg_code/caffe/matlab');
% caffe.set_mode_gpu();
% model = '../step1/VOC-siamese/img_siamese2.prototxt';
% weights = '../step1/VOC-siamese/img_siamese_iter_500000.caffemodel';
% 
% net=caffe.Net(model,'test');
% net.copy_from(weights); 
% names=net.blob_names;
% 
% 
% origin_path = '../VOC/unary(refinenet)/';
% gt_path = '../VOC/SegmentationClass/';
% img_path = '../VOC/img/';
% 
% % train = '../VOC/txt_file/train.txt';
% % fid = fopen(train);
% val = '../VOC/txt_file/val.txt';
% fid = fopen(val);
% i=1; 
% while ~feof(fid)
%     tic;
%     fprintf('data processing %d\n',i);
%     tline=fgetl(fid);%
% %     tline='2007_000129';
% %     tline='2007_006678';
% %     tline='2007_005173';
% %     tline='2007_005331';
%     
% %     tline = '2007_003778';% 500*500
%     
%     matname = strcat(tline,'.mat');
%     mat_name_t = [origin_path,matname];
%     Im_after_fcn8 = load(mat_name_t);
%     
%     segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
%     centroid = struct2cell(Im_after_fcn8.centroid);
%     centroid = reshape(cell2mat(centroid),2,[]);       % 2 * Ns double
%     HSV_average = Im_after_fcn8.HSV_average;           % Ns * 3 double
%     score_average = Im_after_fcn8.score_average;       % Ns * 21 double
%     Ns = max(max(segment));
%     
%     % ground truth
%     gtname = strcat(tline,'.png');
%     gt_name = [gt_path,gtname];  
%     gt = imread(gt_name);
%     % gt image----mapping-----label
%     gt_pixels_label = gt + 1;                  % 0-20 255   -->   1-21 255 
%     index_void = find(gt_pixels_label==255);
%     gt_pixels_label(index_void) = 22;          % 255 -> 22 (22: void)  
% 
%     [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_0720_adjacent(double(segment),gt_pixels_label,Ns);
%     
%     res_c = zeros(2,1);
%     res_r = zeros(2,1);
%     temp =1;
%     for j = 1:length(r)
%         
%         img1 = imread(['../step1/VOC-siamese/siamese_img_val/' tline '_' num2str(c(j)) '.png']);
%         img2 = imread(['../step1/VOC-siamese/siamese_img_val/' tline '_' num2str(r(j)) '.png']);
%         im1_data = double(img1(:, :, [3, 2, 1]));
%         im2_data = double(img2(:, :, [3, 2, 1]));
%         im_data = cat(3,im1_data,im2_data);
%         im_data = permute(im_data, [2,1,3]);
%         im_data = im_data * 0.00390625;
% 
%         net.blobs('pair_data').reshape([size(img1,2),size(img1,1),6,1]); % reshape blob 'data'   原始 500*500*3*1
%         net.reshape();
%         net.blobs('pair_data').set_data(im_data);
%         net.forward_prefilled();
%         prob = net.blobs('prob').get_data();
% 
%         [C,I] = max(prob);
%         if I==2
%            res_c(temp) = c(j);
%            res_r(temp) = r(j);
%            temp = temp + 1;
%         end
%     end
%   
%     r = res_r;
%     c = res_c;
%     num_edges = length(r);
%     % data ground truth ?         
%     data(i).segment = segment;
%     data(i).gt_super_label = gt_super_label;    %  1-22
%     data(i).gt_pixels_label = gt_pixels_label;  %  1-21
%     data(i).flag = flag;                        %  1(need) 0(remove)
%     data(i).index_void = index_void;            %  void(255) label pixel index
% 
%     data(i).num_nodes = Ns;   
%     data(i).num_edges = num_edges;
%     data(i).r_index = r;
%     data(i).c_index = c;   
%     data(i).nodePot = score_average;
% 
%     dis_HSV = sum((HSV_average(r,:) - HSV_average(c,:)).^2,2).^0.5;
%     dis_centroid = sum((centroid(:,r) - centroid(:,c)).^2,1).^0.5;
%     data(i).dis_hsv = exp(-dis_HSV);
%     data(i).dis_euc = exp(-dis_centroid);
%     
%     toc
%     i = i+1;
% %     if(i>1)
% %         break;
% %     end
% %     
% end
% 
% d500 = data(1:500);
% d1000 = data(501:1000);
% d1449 = data(1001:1449);
% save siamese_val_500 d500;
% save siamese_val_1000 d1000;
% save siamese_val_1449 d1449;





%%
clc
close all
clear classes 

addpath(genpath('//home/zhenhua/cv_old/cvpr14/lib/vlfeat-0.9.17/'));

addpath('/home/zhenhua/dfg_code/caffe/matlab');
caffe.set_mode_gpu();
model = '../../step1/VOC-siamese/img_siamese2.prototxt';
weights = '../../step1/VOC-siamese/img_siamese_iter_500000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;


origin_path = '../../VOC/unary(refinenet)/';
gt_path = '../../VOC/SegmentationClass/';
img_path = '../../VOC/img/';

train = '../../VOC/txt_file/train.txt';
fid = fopen(train);
% val = '../VOC/txt_file/val.txt';
% fid = fopen(val);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);%
%     tline='2007_000129';
%     tline='2007_006678';
%     tline='2007_005173';
%     tline='2007_005331';
    
    
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

    [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_0720_adjacent(double(segment),gt_pixels_label,Ns);
    
    res_c = zeros(2,1);
    res_r = zeros(2,1);
    temp =1;
    for j = 1:length(r)
        
        img1 = imread(['../../step1/VOC-siamese/siamese_img_train/' tline '_' num2str(c(j)) '.png']);
        img2 = imread(['../../step1/VOC-siamese/siamese_img_train/' tline '_' num2str(r(j)) '.png']);
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
        if I==2
           res_c(temp) = c(j);
           res_r(temp) = r(j);
           temp = temp + 1;
        end
    end
  
    r = res_r;
    c = res_c;
    num_edges = length(r);
    % data ground truth ?         
    data(i).segment = segment;
    data(i).gt_super_label = gt_super_label;    %  1-22
    data(i).gt_pixels_label = gt_pixels_label;  %  1-21
    data(i).flag = flag;                        %  1(need) 0(remove)
    data(i).index_void = index_void;            %  void(255) label pixel index

    data(i).num_nodes = Ns;   
    data(i).num_edges = num_edges;
    data(i).r_index = r;
    data(i).c_index = c;   
    data(i).nodePot = score_average;

    dis_HSV = sum((HSV_average(r,:) - HSV_average(c,:)).^2,2).^0.5;
    dis_centroid = sum((centroid(:,r) - centroid(:,c)).^2,1).^0.5;
    data(i).dis_hsv = exp(-dis_HSV);
    data(i).dis_euc = exp(-dis_centroid);
    
    
% [sx,sy]=vl_grad(double(segment), 'type', 'forward') ;  
% s = find(sx | sy) ;  
% 
% test = uint8(zeros(size(data(i).segment,1),size(data(i).segment,2),3));
% t = find(gt==0);
% test(t) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% t = find(gt==15);
% test(t) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;   
% t = find(gt==2);
% test(t) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% t = find(gt==255);
% test(t) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 192;
% t = find(gt==14);
% test(t) = 64;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(gt==7);
% test(t) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(gt==13);
% test(t) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(gt==17);
% test(t) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% 
% test([s s+numel(gt(:,:,1)) s+2*numel(gt(:,:,1))])=153;
% imshow(test)
% 
% % % img([s s+numel(gt(:,:,1)) s+2*numel(gt(:,:,1))])=153;
% % % imshow(img)
% % 
% hold on;
% % axis off ; 
% set(gcf,'Position',[0,0,size(segment,2),size(segment,1)]);
% set(gca, 'position', [0 0 1 1 ]); % the axis must be normalized
% %print('-f1', '-r300', '-dpng','xxx.png'); % set the DPI
% for j=1:data(i).num_edges
%     %if(y(j)==1)
%         r = data(i).r_index(j);
%         c = data(i).c_index(j);
%         line([centroid(1,r),centroid(1,c)],[centroid(2,r),centroid(2,c)],'color',[1 1 0],'LineWidth',2);
%     %end
% end  
    
    
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end
%     
end

d500 = data(1:500);
d1000 = data(501:1000);
d1464 = data(1001:1464);
save siamese_train_500 d500;
save siamese_train_1000 d1000;
save siamese_train_1464 d1464;

%% potentials definition：be ready for learning
nc=21;
for i=1:length(data)
    tic;
    fprintf('mpl_learner: pre-processing scan(%d)\n', i);
    crf = data(i);
    num_edges = crf.('num_edges');
    num_nodes = crf.('num_nodes');
    r=crf.r_index;
    c=crf.c_index;
    dis_hsv=crf.dis_hsv;
    dis_euc=crf.dis_euc;
    state  = struct('index', i);  
    
    node_pot=zeros(length(crf.flag),21);
    psi_gt=zeros(length(crf.flag),3);   % (Ns , 3)
    psi_expect=zeros(length(crf.flag),nc,3);    % (Ns,nc,3)

    for j=1:length(crf.flag)
        node_pot(j,:)=-log(crf.nodePot(j,:)+eps)*crf.flag(j);
        gt_lbl=crf.gt_super_label(j);
        if gt_lbl<=nc
            psi_gt(j,1)=-log(crf.nodePot(j,gt_lbl)+eps)*crf.flag(j);
            psi_expect(j,:,1)=-log(crf.nodePot(j,:)+eps)*crf.flag(j);
        end
    end
    
    for k=1:length(r)
        idx_r=r(k);
        idx_c=c(k);
        lbl_r=crf.gt_super_label(idx_r);
        lbl_c=crf.gt_super_label(idx_c);    
        
        if(lbl_r<=nc && lbl_c<=nc)
            if lbl_r==lbl_c
                psi_gt(idx_r,2)=psi_gt(idx_r,2)+(1-dis_hsv(k));
                psi_gt(idx_c,2)=psi_gt(idx_c,2)+(1-dis_hsv(k));
                psi_gt(idx_r,3)=psi_gt(idx_r,3)+(1-dis_euc(k));
                psi_gt(idx_c,3)=psi_gt(idx_c,3)+(1-dis_euc(k));
            else
                psi_gt(idx_r,2)=psi_gt(idx_r,2)+dis_hsv(k);
                psi_gt(idx_c,2)=psi_gt(idx_c,2)+dis_hsv(k);
                psi_gt(idx_r,3)=psi_gt(idx_r,3)+dis_euc(k);
                psi_gt(idx_c,3)=psi_gt(idx_c,3)+dis_euc(k);
            end     

            psi_expect(idx_r,:,2)=psi_expect(idx_r,:,2)+dis_hsv(k);
            psi_expect(idx_r,:,3)=psi_expect(idx_r,:,3)+dis_euc(k);
            psi_expect(idx_r,lbl_c,2)=psi_expect(idx_r,lbl_c,2)+(1-2*dis_hsv(k));
            psi_expect(idx_r,lbl_c,3)=psi_expect(idx_r,lbl_c,3)+(1-2*dis_euc(k));
            psi_expect(idx_c,:,2)=psi_expect(idx_c,:,2)+dis_hsv(k);
            psi_expect(idx_c,:,3)=psi_expect(idx_c,:,3)+dis_euc(k);
            psi_expect(idx_c,lbl_r,2)=psi_expect(idx_c,lbl_r,2)+(1-2*dis_hsv(k));
            psi_expect(idx_c,lbl_r,3)=psi_expect(idx_c,lbl_r,3)+(1-2*dis_euc(k));
        end
    end
    state.nodePot = node_pot;
    state.psi_gt = psi_gt;
    state.psi_expect = psi_expect;
    
    pot.state{i} = state;
    toc
end


%% train
addpath(genpath('./edge_mst'));

weights = -ones(234,1);  
learner = mpl_learner(true, true);         
learner.sigma_2 = ones(234,1)*1;  
learner.weights = weights; 
learner.nc=21;
learner.state = pot.state;

tic
learned_params = fminunc(@(param) fun_obj_grd_knowngraph_1011(learner,data,param),weights,learner.options);
toc

save learned_params_1464_siamese_1  learned_params;

%% inference

d1 = load('./siamese_val_500.mat');
d2 = load('./siamese_val_1000.mat');
d3 = load('./siamese_val_1449.mat');

data = d1.d500;
data(501:1000) = d2.d1000;
data(1001:1449) = d3.d1449;


% addpath(genpath('/home/zhenhua/CV/tools_infer/opengm2.3.4/'));
addpath(genpath('/home/zhenhua/cv_old/tools_infer/opengm2.3.4/'));

for i = 1:length(data)
    tic;
    fprintf('processing %d\n',i);
    
    optimalDecoding = twoOrder_0828(data(i),learned_params);
    optimalDecoding = optimalDecoding + 1; 
%     [a,optimalDecoding]=max(data(i).nodePot');% test superpixels mean_IU
    
    infer_label = zeros(size(data(i).segment,1),size(data(i).segment,2));
    for j=1:data(i).num_nodes
        ins = find(data(i).segment==j);
        infer_label(ins) = optimalDecoding(j);
    end
    
    infer_label(data(i).index_void) = 22;
    
    confusion_mat=confusionmat(double(data(i).gt_pixels_label(:)),double(infer_label(:)),'order',1:22);
    confusion_mat=confusion_mat(1:21,1:21);
    
    if ~exist('confusionMatrix','var')    % confusionMatrix中的变量是否存在，这个只在第1图像使用        
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat; % 把每张图像得到的confusion_mat加起   
    end
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

%%
% 0.785693818650804
% [0.948294094052923;0.858425591250163;0.494005899312765;0.841838474776166;0.707426943875502;
% 0.796754312996408;0.923250044703789;0.847374804234400;0.920739305090770;0.405518952504066;
% 0.902352326495154;0.703493541029690;0.889628152750210;0.871021682785699;0.838120415046619;
% 0.865016073847784;0.641210506946429;0.897401421384094;0.549769655842852;0.860635614346180;0.737292378395218]

%%
addpath(genpath('/home/zhenhua/cv_old/tools_infer/opengm2.3.4/'));

i=1;
optimalDecoding = twoOrder_0828(data(i),learned_params);
infer_label = zeros(size(data(i).segment));
for j=1:data(i).num_nodes
    ins = find(data(i).segment==j);
    infer_label(ins) = optimalDecoding(j);
end
   
test = uint8(zeros(size(data(i).segment,1),size(data(i).segment,2),3));
t = find(infer_label==0);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==15);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;   
t = find(infer_label==2);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==14);
test(t) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==7);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==13);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==17);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
imshow(test);

set(gcf,'Position',[0,0,size(segment,2),size(segment,1)]);
set(gca, 'position', [0 0 1 1 ]); % the axis must be normalized


