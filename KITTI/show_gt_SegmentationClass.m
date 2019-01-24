
clc;
clear all;
close all;

map = [0 0 1;   % Object:Car               0
    1 0 0;      % Road:Road                   1
    0 1 0;      % Building:Building            2
    0 1 1;      % Tree/Bush:Tree/Bush     3
    1 0 0.6;    % Sign/Pole:Pole              4
    1 0.6 0;    % Sky:Sky                      5
    0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
    0 0 0;      % Void:Void                     7
    0 0.6 1;    % Object:Person              8
    1 1 0;      % Road:Mark                   9
    1 0 1;      % Road:Sidewalk              10
    0 1 0.6;    % Road:Curb                   11
    0.6 1 0;    % Building:Wall                12
    0.6 0 1;    % Sign/Pole:Sign             13
    ];

imgpath = './JPEGImages/';
labelpath = './aug_labels/';
test = 'test.txt';
fid = fopen(test);
i=1;
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);

    gt = imread([labelpath tline '.png']);

    X = rgb2ind(gt, map);
    flag_Person   = find(X==8);
    flag_Mark     = find(X==9);
    flag_Sidewalk = find(X==10);
    flag_Curb     = find(X==11);
    flag_Wall     = find(X==12);
    flag_Sign     = find(X==13);

    X(flag_Person) = 0;
    X(flag_Mark)   = 1;
    X(flag_Sidewalk) = 1;
    X(flag_Curb) = 1;
    X(flag_Wall) = 2;
    X(flag_Sign) = 4;

    flag_Object = find(X==0);  
    flag_Road = find(X==1);
    flag_Building = find(X==2);
    flag_Tree = find(X==3);
    flag_Sign = find(X==4);
    flag_Sky = find(X==5);
    flag_Grass = find(X==6);
    flag_Void = find(X==7);

    
    pic = uint8(zeros(376*1241,3));
    pic(flag_Object,:) = repmat([0,0,255],size(flag_Object,1),1);
    pic(flag_Road,:) = repmat([255, 0, 0],size(flag_Road,1),1);
    pic(flag_Building,:) = repmat([0 ,255 ,0],size(flag_Building,1),1);
    pic(flag_Tree,:) = repmat([0 ,255, 255],size(flag_Tree,1),1);
    pic(flag_Sign,:) = repmat([255 ,0 ,153],size(flag_Sign,1),1);
    pic(flag_Sky,:) = repmat([255 156 0],size(flag_Sky,1),1);
    pic(flag_Grass,:) = repmat([0 ,153 ,153],size(flag_Grass,1),1);
    pic(flag_Void,:) = repmat([0 ,0 ,0],size(flag_Void,1),1);
    p = reshape(pic,size(gt));
    imshow(p);
    
    
    
%     a = repmat([255,255,0],10000,1);
%     a = reshape(a,100,100,3);
%     b = repmat([255,0,0],10000,1);
%     b = reshape(b,100,100,3);
%     
%     imshow(a);
%     imshow(gt)
    
    imwrite(p,['SegmentationClass_mapping/' tline '.png']); 
    i = i+1;
end



% figure
% imagesc(aa)
% colormap(map2)