
clc;
clear all;

% im_name_t = [im_path,d_dir(i).name];
% im_name_t = '/home/ding/Desktop/seg/SemMap/Datasets/KITTI/labelling_release/test/images/15_000000.png';
im_name_t = '/media/ding/B6BA-0071/icpr2018/picture/kitti/1origin/13_001200.png';
im_t = imread(im_name_t);


% % train
% wx=[1,1226];
% wy=[1,370];
% test
wx=[1,1241];
wy=[1,376];
I=single(imresize(im_t(wy(1):wy(2),wx(1):wx(2),:),1))/255;
Ig=rgb2gray(I);


% 
% SPixels = segments;

% [SPixels, gidx, I_, ILab] = compute_splxs(I,Ig,par,2);

            minregsiz = 40; % 40 used by wzh, 20 used by Caser 
            reg=500;
            ILab=single(RGB2Lab(I));
            lim2 = double(vl_slic(ILab,15,1000));

            ulim=unique(lim2);
            SPixels=lim2;
            
            for i=1:length(ulim);
                SPixels(lim2==ulim(i))=i;
            end
            
            [gx,gy] = gradient(double(SPixels));  % 梯度计算，gx水平方向上的梯度 gy为垂直方向上的梯度
            %gmag = abs(gx) | abs (gy);
            gidx = find(gx | gy);     % 找出矩阵(gx | gy)(即，两个不同时为0就为1)中的所有非零元素，并将这些元素的线性索引值（linear indices：按列）返回
            
            I_ = I;
            [r,c] = size(Ig);
            I_c=imcomplement(I_);  % 对图像进行求反运算。即[10,20,30]就返回[245,235,225]
            I_(gidx)=I_c(gidx); I_(gidx+r*c)=0; I_(gidx+2*r*c)=0;  % 即I_为梯度不为0的像素点做求反操作

            ILab=single(RGB2Lab(I));
            mxL = 100; mxa = 99; mna = -87;  mxb = 95; mnb = -108;
            ILab(:,:,1) = ILab(:,:,1)/mxL;
            ILab(:,:,2) = (ILab(:,:,2)-mna)/(mxa-mna);
            ILab(:,:,3) = (ILab(:,:,3)-mnb)/(mxb-mnb);



stats=regionprops(SPixels,'centroid','PixelIdxList','PixelList','BoundingBox');

flab = spxls_colors(SPixels,ILab);
lab=flab(1:3,:);

fc=reshape([stats.Centroid]',2,[]);
maxv=max(fc,[],2);
minv=min(fc,[],2);
fc_nor=fc;
fc_nor(1,:)=(fc(1,:)-minv(1))/(maxv(1)-minv(1));
fc_nor(2,:)=(fc(2,:)-minv(2))/(maxv(2)-minv(2));

Gim=compute_im_graph_tree(stats,lab,fc_nor,'color_and_dis');

imshow(I_)