function [r2,c2,gt_label,flag] = edge_and_gtlabel_1201_mst(segments,img,gt_pixels_label,Ns) 

[raw,col] = size(segments);

vot = zeros(Ns,22);
for i=1:raw
    for j=1:col
        index = segments(i,j);                      % index :superpixel index?        
        label = gt_pixels_label(i,j);              % ground truth pixels label?
        vot(index,label) =  vot(index,label) + 1;
    end
end

[~,gt_label] = max(transpose(vot));

flag = ones(1,Ns);
temp = (gt_label==22);  % 1*Ns logical
% for i=1:Ns
%     if(temp(:,i)==1)
%         if((vot(i,22)/sum(vot(i,:)))>=0.5)  % big than 0.5 , remove this node
%             flag(:,i) = 0;                  % flag: 0 represent this node needs to be remove
%         else
%             vot(i,22) = 0;                  % small than 0.5, change label to second order label
%         end
%     end 
% end
% [~,gt_label] = max(transpose(vot));



I = single(img)/255;

SPixels = double(segments);

ILab=single(RGB2Lab(I));
mxL = 100; mxa = 99; mna = -87;  mxb = 95; mnb = -108;
ILab(:,:,1) = ILab(:,:,1)/mxL;
ILab(:,:,2) = (ILab(:,:,2)-mna)/(mxa-mna);
ILab(:,:,3) = (ILab(:,:,3)-mnb)/(mxb-mnb);

stats=regionprops(SPixels,'centroid','PixelIdxList','PixelList','BoundingBox');

% flab = spxls_colors(SPixels,ILab);
% lab=flab(1:3,:);

lab = zeros(3,Ns);
for i=1:Ns
    if(temp(:,i)==1)
        if((vot(i,22)/sum(vot(i,:)))>=0.5)  % big than 0.5 , remove this node
            flag(:,i) = 0;                  % flag: 0 represent this node needs to be remove
        else
            vot(i,22) = 0;                  % small than 0.5, change label to second order label
        end
    end
    s = find(SPixels==i);
    lab(1,i)=sum(ILab(s))/length(s);
    lab(2,i)=sum(ILab(s+numel(SPixels)))/length(s);
    lab(3,i)=sum(ILab(s+2*numel(SPixels)))/length(s);
end
[~,gt_label] = max(transpose(vot));



fc=reshape([stats.Centroid]',2,[]);
maxv=max(fc,[],2);
minv=min(fc,[],2);
fc_nor=fc;
fc_nor(1,:)=(fc(1,:)-minv(1))/(maxv(1)-minv(1));
fc_nor(2,:)=(fc(2,:)-minv(2))/(maxv(2)-minv(2));

% Gim=compute_im_graph_tree(stats,lab,[],'tree_color');
% Gim=compute_im_graph_tree(stats,[],fc_nor,'tree_distance');  
Gim=compute_im_graph_tree(stats,lab,fc_nor,'color_sum_dis');  

r2 = Gim.E(:,2);
c2 = Gim.E(:,1);

end
