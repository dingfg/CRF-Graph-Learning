clc;
clear all;
close all;

test = 'test.txt';
fid = fopen(test);
i=1; 
while ~feof(fid)
    tic;
    fprintf('data processing %d\n',i);
    tline = fgetl(fid);
    matname = strcat(tline,'.mat');
    
    l = load(['rcf_infer/infer_left/' matname]);
    t = load(['rcf_infer/infer_top/' matname]);
    ull = load(['rcf_infer/infer_ul/' matname]);
    urr = load(['rcf_infer/infer_ur/' matname]);
    % % graph=  l.prob + t.prob + ull.prob + urr.prob;
    % % graph=graph./4;
    % figure('name','left');
%     imshow(l.prob);
    % figure('name','top');
    % imshow(t.prob);
    % figure('name','ul');
    % imshow(ull.prob);
    % figure('name','ur');
    % imshow(urr.prob);
    % 
    % graph = zeros(size(l.prob,1),size(l.prob,2),4);
    % graph(:,:,1) = l.prob;
    % graph(:,:,2) = t.prob;
    % graph(:,:,3) = ull.prob;
    % graph(:,:,4) = urr.prob;
    % [a,b] = min(graph,[],3);
    % figure('name','fuse');
    % imshow(a);
    
    imwrite(l.prob,['picture/left/' tline '.png']);
    imwrite(t.prob,['picture/top/' tline '.png']);
    imwrite(ull.prob,['picture/ul/' tline '.png']);
    imwrite(urr.prob,['picture/ur/' tline '.png']);
    
    i = i+1;
    toc
end