% | Name       | (r,g,b)         |  7-Class mapping   |
% |------------|-----------------|--------------------|
% | Car        | (  0,  0,255)   | Object             |
% | Road       | (255,  0,  0)   | Road               |
% | Mark       | (255,255,  0)   | Road               |
% | Building   | (  0,255,  0)   | Building           |
% | Sidewalk   | (255,  0,255)   | Road               |
% | Tree/Bush  | (  0,255,255)   | Tree/Bush          |
% | Pole       | (255,  0,153)   | Sign/Pole          |
% | Sign       | (153,  0,255)   | Sign/Pole          |
% | Person     | (  0,153,255)   | Object             |
% | Wall       | (153,255,  0)   | Building           |
% | Sky        | (255,153,  0)   | Sky                |
% | Curb       | (  0,255,153)   | Road               |
% | Grass/Dirt | (  0,153,153)   | Grass/Dirt         |
% | Void       | (  0,  0,  0)   | Void               |


% Extension
% Side rail	(153,153,153)
% Object	( 0, 0,153)
% Bicycle/Motorbike	(255,255,153)


clc;
clear all;
close all;

imgpath = './images/';
labelpath = './labels_new/';
gtDir = dir([labelpath '*.png']);
for i = 1:length(gtDir)

    fprintf('data processing %d\n',i);
    gt = imread([labelpath gtDir(i).name]);

%     flag_Car      = find(gt(:,:,1)==0   & gt(:,:,2)==0   & gt(:,:,3)==255);
%     flag_Road     = find(gt(:,:,1)==255 & gt(:,:,2)==0   & gt(:,:,3)==0  );
%     flag_Mark     = find(gt(:,:,1)==255 & gt(:,:,2)==255 & gt(:,:,3)==0  );
%     flag_Building = find(gt(:,:,1)==0   & gt(:,:,2)==255 & gt(:,:,3)==0  );
%     flag_Sidewalk = find(gt(:,:,1)==255 & gt(:,:,2)==0   & gt(:,:,3)==255);
%     flag_Tree     = find(gt(:,:,1)==0   & gt(:,:,2)==255 & gt(:,:,3)==255);
%     flag_Pole     = find(gt(:,:,1)==255 & gt(:,:,2)==0   & gt(:,:,3)==153);
%     flag_Sign     = find(gt(:,:,1)==153 & gt(:,:,2)==0   & gt(:,:,3)==255);
%     flag_Person   = find(gt(:,:,1)==0   & gt(:,:,2)==153 & gt(:,:,3)==255);
%     flag_Wall     = find(gt(:,:,1)==153 & gt(:,:,2)==255 & gt(:,:,3)==0  );
%     flag_Sky      = find(gt(:,:,1)==255 & gt(:,:,2)==153 & gt(:,:,3)==0  );
%     flag_Curb     = find(gt(:,:,1)==0   & gt(:,:,2)==255 & gt(:,:,3)==153);
%     flag_Grass    = find(gt(:,:,1)==0   & gt(:,:,2)==153 & gt(:,:,3)==153);
%     flag_Void     = find(gt(:,:,1)==0   & gt(:,:,2)==0   & gt(:,:,3)==0  );
%     flag_Siderail = find(gt(:,:,1)==153 & gt(:,:,2)==153 & gt(:,:,3)==153);
%     flag_Object   = find(gt(:,:,1)==0   & gt(:,:,2)==0   & gt(:,:,3)==153);
%     flag_Bicycle  = find(gt(:,:,1)==255 & gt(:,:,2)==255 & gt(:,:,3)==153);
%     gt_map = ones(size(gt,1),size(gt,2)) * 20;
%     gt_map(flag_Car) = 0;
%     gt_map(flag_Road) = 1;
%     gt_map(flag_Mark) = 2;
%     gt_map(flag_Building) = 3;
%     gt_map(flag_Sidewalk) = 4;
%     gt_map(flag_Tree) = 5;
%     gt_map(flag_Pole) = 6;
%     gt_map(flag_Sign) = 7;
%     gt_map(flag_Person) = 8;
%     gt_map(flag_Wall) = 9;
%     gt_map(flag_Sky) = 10;
%     gt_map(flag_Curb) = 11;
%     gt_map(flag_Grass) = 12;
%     gt_map(flag_Void) = 255;
%     gt_map(flag_Siderail) = 13;
%     gt_map(flag_Object) = 14;
%     gt_map(flag_Bicycle) = 15;
    
%     gt_map = ones(size(gt,1),size(gt,2)) * 20;
%     gt_map(flag_Car) = 0;
%     gt_map(flag_Road) = 1;
%     gt_map(flag_Mark) = 1;
%     gt_map(flag_Building) = 2;
%     gt_map(flag_Sidewalk) = 1;
%     gt_map(flag_Tree) = 3;
%     gt_map(flag_Pole) = 4;
%     gt_map(flag_Sign) = 4;
%     gt_map(flag_Person) = 0;
%     gt_map(flag_Wall) = 2;
%     gt_map(flag_Sky) = 5;
%     gt_map(flag_Curb) = 1;
%     gt_map(flag_Grass) = 6;
%     gt_map(flag_Void) = 255;
%     
%     gt_map(flag_Siderail) = 7;
%     gt_map(flag_Object) = 0;
%     gt_map(flag_Bicycle) = 8;

    map = [0 0 1;   % Object:Car
        1 0 0;      % Road:Road
        0 1 0;      % Building:Building
        0 1 1;      % Tree/Bush:Tree/Bush
        1 0 0.6;    % Sign/Pole:Pole
        1 0.6 0;    % Sky:Sky
        0 0.6 0.6;  % Grass/Dirt:Grass/Dirt
        0.6 0.6 0.6;% Side rail:Side rail
        1 1 0.6;    % Bicycle/Motorbike:Bicycle/Motorbike
        0 0 0;      % Void:Void
        0 0.6 1;    % Object:Person
        0 0 0.6;    % Object:Object
        1 1 0;      % Road:Mark
        1 0 1;      % Road:Sidewalk
        0 1 0.6;    % Road:Curb
        0.6 1 0;    % Building:Wall
        0.6 0 1;    % Sign/Pole:Sign
        ];
    X = rgb2ind(gt, map);
    flag_Void     = find(X==9);
    flag_Person   = find(X==10);
    flag_Object   = find(X==11);
    flag_Mark     = find(X==12);
    flag_Sidewalk = find(X==13);
    flag_Curb     = find(X==14);
    flag_Wall     = find(X==15);
    flag_Sign     = find(X==16);
%     X(flag_Void)   = 255;
    X(flag_Person) = 0;
    X(flag_Object) = 0;
    X(flag_Mark)   = 1;
    X(flag_Sidewalk) = 1;
    X(flag_Curb) = 1;
    X(flag_Wall) = 2;
    X(flag_Sign) = 4;
    
%     [X,map] = rgb2ind(gt,17);
%     figure
%     imagesc(X)
%     colormap(map)
%     imwrite(X,'1.png');
% 
%     aa = imread('1.png');
    imwrite(X,strcat('gt/',gtDir(i).name)); 
end

% aa = imread('gt/00_000200.png');
