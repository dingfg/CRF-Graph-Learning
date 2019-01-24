%    image ->  segments/score_average/ hsv_average/centroid

run('/home/zhenhua/CV/sseg/vlfeat-0.9.15/toolbox/vl_setup')

clc;
clear all;

img = './img/';
a08 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/0.8/predict_result_full/';
b10 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/1.0/predict_result_full/';
c06 = '/home/zhenhua/Desktop/dfg_code/refinenet-master/cache_data/test_examples_voc/0.6/predict_result_full/';

trainval = './txt_file/trainval.txt';
fid = fopen(trainval);

i=1; 
while ~feof(fid)
    tic;
%     fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    tline='2007_000129';
%     tline='2007_006678';
%     tline='2007_005173';
%     tline='2007_005331';
    matname = strcat(tline,'.mat');
    m1 = load(strcat(a08,matname));
    m2 = load(strcat(b10,matname));
    m3 = load(strcat(c06,matname));
    im = imread(strcat(img,strcat(tline,'.jpg')));
    m1 = single(gather(m1.data_obj.score_map))/255;
    m2 = single(gather(m2.data_obj.score_map))/255;
    m3 = single(gather(m3.data_obj.score_map))/255;
    
    a = zeros(size(im,1),size(im,2),21);
    b = zeros(size(im,1),size(im,2),21);
    c = zeros(size(im,1),size(im,2),21);
    for j =1:21
        a(:,:,j) =  imresize(m1(:,:,j),[size(im,1),size(im,2)],'bilinear');
        b(:,:,j) =  imresize(m2(:,:,j),[size(im,1),size(im,2)],'bilinear');
        c(:,:,j) =  imresize(m3(:,:,j),[size(im,1),size(im,2)],'bilinear');
    end
    m = (a+b+c)/3;
    prob = m;

    
% [~,label] = max(m,[],3);
% infer_label = label - 1;
%    
% test = uint8(zeros(size(im)));
% t = find(infer_label==0);
% test(t) = 0;
% test(t+size(im,2)*size(im,1)) = 0;
% test(t+size(im,2)*size(im,1)*2) = 0;
% t = find(infer_label==15);
% test(t) = 192;
% test(t+size(im,2)*size(im,1)) = 128;
% test(t+size(im,2)*size(im,1)*2) = 128;   
% t = find(infer_label==2);
% test(t) = 0;
% test(t+size(im,2)*size(im,1)) = 128;
% test(t+size(im,2)*size(im,1)*2) = 0;
% t = find(infer_label==14);
% test(t) = 64;
% test(t+size(im,2)*size(im,1)) = 128;
% test(t+size(im,2)*size(im,1)*2) = 128;
% t = find(infer_label==7);
% test(t) = 128;
% test(t+size(im,2)*size(im,1)) = 128;
% test(t+size(im,2)*size(im,1)*2) = 128;
% t = find(infer_label==13);
% test(t) = 192;
% test(t+size(im,2)*size(im,1)) = 0;
% test(t+size(im,2)*size(im,1)*2) = 128;
% t = find(infer_label==17);
% test(t) = 128;
% test(t+size(im,2)*size(im,1)) = 64;
% test(t+size(im,2)*size(im,1)*2) = 0;
% imshow(test);
% 
% set(gcf,'Position',[0,0,size(im,2),size(im,1)]);
% set(gca, 'position', [0 0 1 1 ]); % the axis must be normalized
    
    
    im_single = single( vl_rgb2xyz(im) );  
    segments = vl_slic(im_single, 15, 0.1) ;
    segments_unique_len = max(segments(:))+1;
    segments_len = length(unique(segments));
    while(segments_unique_len~=segments_len)
        for l=1:segments_unique_len
            if(~sum(any(segments==l)))
                ind = find(segments==segments_unique_len-1);
                segments(ind) = l;              
                break;
            end
        end
        segments_unique_len = max(segments(:))+1;
        segments_len = length(unique(segments));
    end
    
    score_average = zeros(segments_unique_len,size(prob,3));
    HSV_average = zeros(segments_unique_len,3);
    im_hsv = rgb2hsv(im);
    jishu = zeros(1,segments_unique_len);
    
    p = reshape(prob,size(prob,1)*size(prob,2),size(prob,3));
    hsv = reshape(im_hsv,size(im,1)*size(im,2),size(im,3));
    for j = 1:segments_len
        ind = find(segments==j-1);
        jishu(j) = length(ind);
        score_average(j,:) = sum(p(ind,:));
        HSV_average(j,:) = sum(hsv(ind,:));
    end
 
    score_average = bsxfun(@rdivide,score_average,jishu');
    HSV_average = bsxfun(@rdivide,HSV_average,jishu');
    segments = segments + 1; % 0-X  转为 1-(X+1)
    centroid = regionprops(segments,'Centroid');
   
    save(strcat('unary(refinenet)/',matname),'segments','score_average','HSV_average','centroid');  
    disp(['processing succeed = ',num2str(i)]);
    
    i=i+1;
    toc
end

% test = imread('img/2007_005331.jpg');
% [sx,sy]=vl_grad(double(segments), 'type', 'forward') ;  % 梯度
% s = find(sx | sy) ;  
% imp = test;  
% imp([s s+numel(test(:,:,1)) s+2*numel(test(:,:,1))]) = 255;
% %imp(s+2*numel(test(:,:,1))) = 255;
% imshow(imp)
