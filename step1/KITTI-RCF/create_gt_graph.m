clear all
close all
clear classes 

fid2 = fopen('dfg_data_left_train_pair.lst','w');
fid3 = fopen('dfg_data_top_train_pair.lst','w');
fid4 = fopen('dfg_data_ul_train_pair.lst','w');
fid5 = fopen('dfg_data_ur_train_pair.lst','w');

saveDatapath_left = 'gt/gt_left/';
saveDatapath_top = 'gt/gt_top/';
saveDatapath_ul = 'gt/gt_ul/';
saveDatapath_ur = 'gt/gt_ur/';

f = 1;
trainpath = 'train.txt';
test = 'test.txt';
fid = fopen(test);
imgDataPath = '/home/zhenhua/Desktop/caffe-master/data/mydata/SegmentationClass/';            
while ~feof(fid)
    tline=fgetl(fid);
    imgpath = [imgDataPath tline '.png'];   

    gt = imread(imgpath);

    create_one_gt_graph( gt ,tline );

    fprintf(fid2,'train_rcf/JPEGImages/%s train_rcf/gt/gt_left/%s\n',[tline '.png'], [tline '.png']);
    fprintf(fid3,'train_rcf/JPEGImages/%s train_rcf/gt/gt_top/%s\n',[tline '.png'], [tline '.png']);          
    fprintf(fid4,'train_rcf/JPEGImages/%s train_rcf/gt/gt_ul/%s\n',[tline '.png'], [tline '.png']);
    fprintf(fid5,'train_rcf/JPEGImages/%s train_rcf/gt/gt_ur/%s\n',[tline '.png'], [tline '.png']);

    fprintf('data processing %d\n',f);
    f=f+1;
end


fclose(fid2);
fclose(fid3);
fclose(fid4);
fclose(fid5);

