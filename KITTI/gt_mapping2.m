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
gtDir = dir([labelpath '*.png']);
for i = 1:length(gtDir)

    fprintf('data processing %d\n',i);
    gt = imread([labelpath gtDir(i).name]);

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

    imwrite(X,strcat('gt/',gtDir(i).name)); 
end


% aa = imread('SegmentationClass/13_000200.png');
% map2 = [0 0 1;   % Object:Car               0
%     1 0 0;      % Road:Road                   1
%     0 1 0;      % Building:Building            2
%     0 1 1;      % Tree/Bush:Tree/Bush     3
%     1 0 0.6;    % Sign/Pole:Pole              4
%     1 0.6 0;    % Sky:Sky                      5
% %     0 0.6 0.6;  % Grass/Dirt:Grass/Dirt     6
%     0 0 0;      % Void:Void                     7
%     ];
% figure
% imagesc(aa)
% colormap(map2)