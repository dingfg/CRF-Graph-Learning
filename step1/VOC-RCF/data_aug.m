clc;
clear all;
close all;

imgpath = '../../VOC/img/';
labelpath = '../../VOC/SegmentationClass/';
imgpath_save = './img/';
labelpath_save = './labels/';

train = '../../VOC/train.txt';
fid2 = fopen('train.txt','w');
fid = fopen(train);
i=1;
while ~feof(fid)
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    im = imread([imgpath tline '.jpg']);
    label = imread([labelpath tline '.png']);
    
    imwrite(im,[imgpath_save tline '.jpg' ]);
    imwrite(label,[labelpath_save tline '.png' ]);
    im_flip = im(:,end:-1:1,:);
    label_flip = label(:,end:-1:1,:);
    imwrite(im_flip,[imgpath_save tline '_1.jpg' ]);
    imwrite(label_flip,[labelpath_save tline '_1.png' ]);
    
    fprintf(fid2,'%s\n',tline);
    fprintf(fid2,'%s\n',[tline '_1']);
    i = i + 1;
end