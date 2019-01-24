
clc
close all
clear classes 

addpath(genpath('//home/zhenhua/cv_old/cvpr14/lib/vlfeat-0.9.17/'));
addpath('/home/zhenhua/dfg_code/caffe/matlab');
caffe.set_mode_gpu();
model = '../../step1/KITTI-siamese/img_siamese2.prototxt';
weights = '../../step1/KITTI-siamese/img_siamese_iter_500000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;


origin_path = '../../KITTI/superpixel_&_pixel/dataset(superpixel_unary)/';
gt_path = '../../KITTI/SegmentationClass/';
img_path = '../../KITTI/JPEGImages/';

train = '../../KITTI/train.txt';
fid = fopen(train);
% test = '../../KITTI/test.txt';
% fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
%     tline='13_000200';
%     tline='13_001200';
%     tline='13_001400';
%     tline='13_003000';
%     tline='16_001200';
    
    matname = strcat(tline,'.mat');
    mat_name_t = [origin_path,matname];
    Im_after_fcn8 = load(mat_name_t);
    
    segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
    centroid = struct2cell(Im_after_fcn8.centroid);
    centroid = reshape(cell2mat(centroid),2,[]);       % 2 * Ns double
    HSV_average = Im_after_fcn8.HSV_average;           % Ns * 3 double
    score_average = Im_after_fcn8.score_average;       % Ns * 21 double
    [~,a2] = max(score_average,[],2);
    Ns = max(max(segment));
    
    % ground truth
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-7   -->   1-8 
    index_void = find(gt_pixels_label==8);

    [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_1028_adjacent(double(segment),gt_pixels_label,Ns);
    
    res_c = zeros(2,1);
    res_r = zeros(2,1);
    temp =1;
    for j = 1:length(r)
        
        img1 = imread(['../../step1/KITTI-siamese/siamese_img_train/' tline '_' num2str(c(j)) '.png']);
        img2 = imread(['../../step1/KITTI-siamese/siamese_img_train/' tline '_' num2str(r(j)) '.png']);
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
% gt_name = [gt_path,tline,'.png'];  
% gt = imread(gt_name); 
% % gt([s s+numel(gt(:,:,1)) s+2*numel(gt(:,:,1))])=153;
% % imshow(gt);
% 
% pic = uint8(zeros(376*1241,3));
% 
% flag_Object = find(gt==0);  
% flag_Road = find(gt==1);
% flag_Building = find(gt==2);
% flag_Tree = find(gt==3);
% flag_Sign = find(gt==4);
% flag_Sky = find(gt==5);
% flag_Grass = find(gt==6);
% 
% pic(flag_Sky,:) = repmat([255 156 0],size(flag_Sky,1),1);
% pic(flag_Grass,:) = repmat([0 153 153],size(flag_Grass,1),1);
% 
% pic(flag_Object,:) = repmat([0 0 255],size(flag_Object,1),1);
% pic(flag_Road,:) = repmat([255 0 0],size(flag_Road,1),1);
% pic(flag_Building,:) = repmat([0 255 0],size(flag_Building,1),1);
% 
% pic(flag_Tree,:) = repmat([0 ,255, 255],size(flag_Tree,1),1);
% pic(flag_Sign,:) = repmat([255 0 153],size(flag_Sign,1),1);
% 
% 
% p = reshape(pic,[376,1241,3]);
% 
% imshow(p)
% 
% 
% hold on;
% % axis off ; 
% set(gcf,'Position',[0,0,1241,376]);
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


%% potentials definition：be ready for learning
nc=7;

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
    
    node_pot=zeros(length(crf.flag),nc);
    psi_gt=zeros(length(crf.flag),31);   % (Ns , 31)
    psi_expect=zeros(length(crf.flag),nc,31);    % (Ns,nc,31)
 
    for j=1:length(crf.flag)
        node_pot(j,:)=-log(max(crf.nodePot(j,:),eps))*crf.flag(j);
        gt_lbl=crf.gt_super_label(j);
        if gt_lbl<=nc
            psi_gt(j,1)=-log(max(crf.nodePot(j,gt_lbl),eps))*crf.flag(j);
            psi_expect(j,:,1)=-log(max(crf.nodePot(j,:),eps))*crf.flag(j);
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
            l_max = max(lbl_r,lbl_c);
            l_min = min(lbl_r,lbl_c);
            psi_gt(idx_r, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) = psi_gt(idx_r, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) + 1 ;  
            psi_gt(idx_c, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) = psi_gt(idx_c, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) + 1 ;


            psi_expect(idx_r,:,2)=psi_expect(idx_r,:,2)+dis_hsv(k);
            psi_expect(idx_r,:,3)=psi_expect(idx_r,:,3)+dis_euc(k);
            psi_expect(idx_r,lbl_c,2)=psi_expect(idx_r,lbl_c,2)+(1-2*dis_hsv(k));
            psi_expect(idx_r,lbl_c,3)=psi_expect(idx_r,lbl_c,3)+(1-2*dis_euc(k));
            psi_expect(idx_c,:,2)=psi_expect(idx_c,:,2)+dis_hsv(k);
            psi_expect(idx_c,:,3)=psi_expect(idx_c,:,3)+dis_euc(k);
            psi_expect(idx_c,lbl_r,2)=psi_expect(idx_c,lbl_r,2)+(1-2*dis_hsv(k));
            psi_expect(idx_c,lbl_r,3)=psi_expect(idx_c,lbl_r,3)+(1-2*dis_euc(k));

            for j = 1:lbl_r
                psi_expect(idx_c,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_r) )=psi_expect(idx_c,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_r) ) + 1;            
            end
            for j = lbl_r+1:nc
                psi_expect(idx_c,j, 3 + (nc*lbl_r-(lbl_r^2-lbl_r)/2-nc+j ))=psi_expect(idx_c,j, 3 + (nc*lbl_r-(lbl_r^2-lbl_r)/2-nc+j )) + 1;         
            end
            for j = 1:lbl_c
                psi_expect(idx_r,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_c) )=psi_expect(idx_r,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_c) ) + 1; 
            end
            for j = lbl_c+1:nc
                psi_expect(idx_r,j, 3 + (nc*lbl_c-(lbl_c^2-lbl_c)/2-nc+j ))=psi_expect(idx_r,j, 3 + (nc*lbl_c-(lbl_c^2-lbl_c)/2-nc+j )) + 1;
            end
        
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


weights = -ones(31,1);  
learner = mpl_learner(true, true);         
learner.sigma_2 = ones(31,1)*1;  
learner.weights = weights; 
learner.nc=7;
learner.state = pot.state;

tic
learned_params = fminunc(@(param) fun_obj_grd_knowngraph_1028(learner,data,param),weights,learner.options);
toc

save learned_params_siamese_1  learned_params;





%% 


clc
close all
clear classes 


addpath('/home/zhenhua/dfg_code/caffe/matlab');
caffe.set_mode_gpu();
model = '../../step1/KITTI-siamese/img_siamese2.prototxt';
weights = '../../step1/KITTI-siamese/img_siamese_iter_500000.caffemodel';

net=caffe.Net(model,'test');
net.copy_from(weights); 
names=net.blob_names;


origin_path = '../../KITTI/superpixel_&_pixel/dataset(superpixel_unary)/';
gt_path = '../../KITTI/SegmentationClass/';
img_path = '../../KITTI/JPEGImages/';

test = '../../KITTI/test.txt';
fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    
    matname = strcat(tline,'.mat');
    mat_name_t = [origin_path,matname];
    Im_after_fcn8 = load(mat_name_t);
    
    segment = Im_after_fcn8.segments;                  % after vl_slic : 1-Ns          
    centroid = struct2cell(Im_after_fcn8.centroid);
    centroid = reshape(cell2mat(centroid),2,[]);       % 2 * Ns double
    HSV_average = Im_after_fcn8.HSV_average;           % Ns * 3 double
    score_average = Im_after_fcn8.score_average;       % Ns * 21 double
    [~,a2] = max(score_average,[],2);
    Ns = max(max(segment));
    
    % ground truth
    gtname = strcat(tline,'.png');
    gt_name = [gt_path,gtname];  
    gt = imread(gt_name);
    % gt image----mapping-----label
    gt_pixels_label = gt + 1;                  % 0-7   -->   1-8 
    index_void = find(gt_pixels_label==8);

    [r,c,r2,c2,gt_super_label,flag] = edge_and_gtlabel_1028_adjacent(double(segment),gt_pixels_label,Ns);
    
    res_c = zeros(2,1);
    res_r = zeros(2,1);
    temp =1;
    for j = 1:length(r)
        
        img1 = imread(['../../step1/KITTI-siamese/siamese_img_test/' tline '_' num2str(c(j)) '.png']);
        img2 = imread(['../../step1/KITTI-siamese/siamese_img_test/' tline '_' num2str(r(j)) '.png']);
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
    
    toc
    i = i+1;
%     if(i>1)
%         break;
%     end
%     
end

%% inference
addpath(genpath('/home/zhenhua/cv_old/tools_infer/opengm2.3.4/'));

clear confusionMatrix;
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
    
    infer_label(data(i).index_void) = 8;
    
    confusion_mat=confusionmat(double(data(i).gt_pixels_label(:)),double(infer_label(:)),'order',1:8);
    confusion_mat=confusion_mat(1:7,1:7);
    
    if ~exist('confusionMatrix','var')    % confusionMatrix中的变量是否存在，这个只在第1图像使用        
        confusionMatrix=confusion_mat;
    else
        confusionMatrix=confusionMatrix+confusion_mat; % 把每张图像得到的confusion_mat加起   
    end
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

%%
% 1: 0.644380898668824
% [0.771450435696270;0.920177027355107;0.825352563293629;0.775580376937229;0.087717199234281;0.876206042457467;0.254182645707784]

% 01:0.629098409323835
% [0.748849725642691;0.913768846149755;0.803810713688107;0.815115087079059;0.088387078379380;0.795586268688205;0.238171145639648]

%%
    i=1;
    optimalDecoding = twoOrder_0828(data(i),learned_params);
    infer_label = zeros(376,1241);
    for j=1:data(i).num_nodes
        ins = find(data(i).segment==j);
        infer_label(ins) = optimalDecoding(j);
    end
                    %     infer_label = infer_label + 1;
                    %     map2 = [0 0 1;   % Object:Car               0
                    %         1 0 0;      % Road:Road                   1
                    %         0 1 0;      % Building:Building            2
                    %         0 1 1;      % Tree/Bush:Tree/Bush     3
                    %         1 0 0.6;    % Sign/Pole:Pole              4
                    %     %     1 0.6 0;    % Sky:Sky                      5
                    %         0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
                    %     %     0 0 0;      % Void:Void                     7
                    %         ];
    pic = uint8(zeros(376*1241,3));
    
    flag_Object = find(infer_label==0);  
    flag_Road = find(infer_label==1);
    flag_Building = find(infer_label==2);
    flag_Tree = find(infer_label==3);
    flag_Sign = find(infer_label==4);
    flag_Sky = find(infer_label==5);
    flag_Grass = find(infer_label==6);
    
    pic(flag_Sky,:) = repmat([255 156 0],size(flag_Sky,1),1);
    pic(flag_Grass,:) = repmat([0 153 153],size(flag_Grass,1),1);
    
    pic(flag_Object,:) = repmat([0 0 255],size(flag_Object,1),1);
    pic(flag_Road,:) = repmat([255 0 0],size(flag_Road,1),1);
    pic(flag_Building,:) = repmat([0 255 0],size(flag_Building,1),1);
    
    pic(flag_Tree,:) = repmat([0 ,255, 255],size(flag_Tree,1),1);
    pic(flag_Sign,:) = repmat([255 0 153],size(flag_Sign,1),1);
    
    
    p = reshape(pic,[376,1241,3]);
    
    imshow(p)
    set(gcf,'Position',[0,0,1241,376]);
    set(gca, 'position', [0 0 1 1 ]); 
    
    