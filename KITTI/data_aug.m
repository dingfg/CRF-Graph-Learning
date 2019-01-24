clc;
clear all;
close all;

imgpath = './JPEGImages/';
labelpath = './labels/';
train = '/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/train.txt';
fid2 = fopen('train.txt','w');
fid = fopen(train);
i=1;
while ~feof(fid)
    fprintf('data processing %d\n',i);
    tline=fgetl(fid);
    im = imread([imgpath tline '.png']);
    label = imread([labelpath tline '.png']);
    im_flip = im(:,end:-1:1,:);
    label_flip = label(:,end:-1:1,:);
    imwrite(im_flip,[imgpath tline '_1.png' ]);
    imwrite(label_flip,[labelpath tline '_1.png' ]);
    fprintf(fid2,'%s\n',tline);
    fprintf(fid2,'%s\n',[tline '_1']);
    i = i + 1;
end