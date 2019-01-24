clc
close all
clear classes 


addpath(genpath('/home/zhenhua/CV/sseg/vlfeat-0.9.15/'));

 
origin_path = '../VOC/unary(refinenet)/';
gt_path = '../VOC/SegmentationClass/';
img_path = '../VOC/img/';

% train = '../VOC/txt_file/train.txt';
% fid = fopen(train);
val = '../VOC/txt_file/val.txt';
fid = fopen(val);
i=1; 
while ~feof(fid)
    tic;
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
    
%     left = load('left.mat');
%     top = load('top.mat');
%     ul =load('ul.mat');
%     ur = load('ur.mat');
    left = load(strcat('../step1/VOC-RCF/rcf/infer_trainval/infer_left/',matname));
    top = load(strcat('../step1/VOC-RCF/rcf/infer_trainval/infer_top/',matname));
    ul = load(strcat('../step1/VOC-RCF/rcf/infer_trainval/infer_ul/',matname));
    ur = load(strcat('../step1/VOC-RCF/rcf/infer_trainval/infer_ur/',matname));  
    
    theta = 0.90;

    [r,c,gt_super_label,flag] = edge_and_gtlabel_1102(double(segment),gt_pixels_label,left.prob,top.prob,ul.prob,ur.prob,Ns,theta);

%     [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_0720_adjacent(double(segment),gt_pixels_label,Ns);

%     img_onepath = [img_path tline '.jpg'];
%     img = imread(img_onepath); 
%     [r,c,gt_super_label,flag] = edge_and_gtlabel_1201_mst(segment,img,gt_pixels_label,Ns); 
 
        
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


% d1 = load('refinenet/theta_099/train/d500.mat');
% d2 = load('refinenet/theta_099/train/d1000.mat');
% d3 = load('refinenet/theta_099/train/d1464.mat');
% 
% data = d1.d500;
% data(501:1000) = d2.d1000;
% data(1001:1464) = d3.d1464;
% 
d1 = load('/home/zhenhua/dfg_code/0827_code/0831_15_0.1/voc/refinenet/train/ver1/data.mat/theta_90/val/d90_500.mat');
d2 = load('/home/zhenhua/dfg_code/0827_code/0831_15_0.1/voc/refinenet/train/ver1/data.mat/theta_90/val/d90_1000.mat');
d3 = load('/home/zhenhua/dfg_code/0827_code/0831_15_0.1/voc/refinenet/train/ver1/data.mat/theta_90/val/d90_1449.mat');

data = d1.d500;
data(501:1000) = d2.d1000;
data(1001:1449) = d3.d1449;
% 
% 
% d500 = data(1:500);
% d1000 = data(501:1000);
% d1464 = data(1001:1464);
% save mst_col_d500 d500;
% save mst_col_d1000 d1000;
% save mst_col_d1464 d1464;
% 
% d500 = data(1:500);
% d1000 = data(501:1000);
% d1449 = data(1001:1449);
% save mst_col_500 d500;
% save mst_col_1000 d1000;
% save mst_col_1449 d1449;

% d1 = load('theta_90/train/d90_500.mat');
% d2 = load('theta_90/train/d90_1000.mat');
% d3 = load('theta_90/train/d90_1464.mat');
% 
% data = d1.d500;
% data(501:1000) = d2.d1000;
% data(1001:1464) = d3.d1464;

% d1 = load('./test_mat/mst_col_500.mat');
% d2 = load('./test_mat/mst_col_1000.mat');
% d3 = load('./test_mat/mst_col_1449.mat');
% 
% data = d1.d500;
% data(501:1000) = d2.d1000;
% data(1001:1449) = d3.d1449;

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
learner.sigma_2 = ones(234,1)*10;  
learner.weights = weights; 
learner.nc=21;
learner.state = pot.state;

tic
learned_params = fminunc(@(param) fun_obj_grd_knowngraph_1102(learner,data,param),weights,learner.options);
toc

save learned_params_1464_mst_col_10  learned_params;


%% inference
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

%% IoU result
%superpixel: 95.22 88.21 59.79 86.84 74.07    79.947 93.04 85.548 92.17 40.11     90.58 67.63 89.92 88.246 85.68    87.99 65.38 90.76 55.64 87.647 74.60
%79.954
%adj_01    : 94.77 86.37 47.60 85.16 72.21     79.90 93.29 85.06 92.07 40.40    89.81 71.76 89.27 87.38 84.29   86.09 62.69 89.75 57.09 86.56 73.87
%78.83
% 90_1    : 95.30 88.24 60.02 86.37 74.11     80.35 93.21 85.88 92.61 40.66    90.92 69.01 90.37 88.53 85.51    87.98 65.82 90.84 55.91 88.23 74.77
% 80.22

%mst_sum_10:95.10 87.98 56.90 85.72 74.58   79.70 93.40 85.548 92.21 41.33   90.64 69.79 90.10 88.04 85.32    87.61 65.93 90.50 55.94 87.32 73.147
% 79.848
%mst_col_1:   95.26 88.24 58.78 87.11 74.22   79.754 93.81 85.67 92.51 43.059  91.46 69.32 90.40 88.61 85.48    87.83 66.09 90.77 57.14 87.87 73.78
% 80.34
%mst_dis_10 : 95.02 87.25 55.24 85.84 74.18   79.56 93.22 85.36 91.98 40.62    90.47 70.27 89.62 87.71 84.68    87.07 65.02 90.48 56.08 87.81 72.69
%79.53



%%
% i=1;
% optimalDecoding = twoOrder_0828(data(i),learned_params);
% infer_label = zeros(size(data(i).segment));
% for j=1:data(i).num_nodes
%     ins = find(data(i).segment==j);
%     infer_label(ins) = optimalDecoding(j);
% end
%    
% test = uint8(zeros(size(data(i).segment,1),size(data(i).segment,2),3));
% t = find(infer_label==0);
% test(t) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% t = find(infer_label==15);
% test(t) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;   
% t = find(infer_label==2);
% test(t) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% t = find(infer_label==14);
% test(t) = 64;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(infer_label==7);
% test(t) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(infer_label==13);
% test(t) = 192;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
% t = find(infer_label==17);
% test(t) = 128;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
% test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
% imshow(test);
% 
% set(gcf,'Position',[0,0,size(segment,2),size(segment,1)]);
% set(gca, 'position', [0 0 1 1 ]); % the axis must be normalized







val = '../txt_file/val.txt';
fid = fopen(val);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    
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
t = find(infer_label==1);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==2);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==3);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==4);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==5);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==6);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==7);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==8);
test(t) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==9);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==10);
test(t) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==11);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==12);
test(t) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==13);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==14);
test(t) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
t = find(infer_label==15);
test(t) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;   
t = find(infer_label==16);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==17);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==18);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==19);
test(t) = 128;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 192;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 0;
t = find(infer_label==20);
test(t) = 0;
test(t+size(data(i).segment,2)*size(data(i).segment,1)) = 64;
test(t+size(data(i).segment,2)*size(data(i).segment,1)*2) = 128;
imshow(test);
    

    imwrite(test,['result/' tline '.png']); 
    
    i=i+1;
    toc
end