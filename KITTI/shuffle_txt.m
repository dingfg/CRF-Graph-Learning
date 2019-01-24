clear all;
clc;


fidin=fopen('/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/train.txt');
fidout = fopen('/home/zhenhua/Desktop/caffe-master/data/mydata/ImageSets/Segmentation/train_shuffle.txt','w');
index =0;
while ~feof(fidin)                   %?????????                                      
   tline=fgetl(fidin);
   index =index+1;
   str{index} = tline;
end


rand_index = randperm(index);


for i=1:index
    fprintf(fidout, '%s\n',str{rand_index(i)});   
end


fopen(fidin);
fopen(fidout);