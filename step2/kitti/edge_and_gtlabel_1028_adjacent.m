function [r2,c2,r,c,gt_label,flag] = edge_and_gtlabel_1028_adjacent(segments,gt_pixels_label,Ns)
                                                  % segments=segment;
neigh_relation = zeros(Ns,Ns);
[raw,col] = size(segments);

vot = zeros(Ns,8);
for i=1:raw
    for j=1:col
        index = segments(i,j);                      % index :superpixel index?        
        label = gt_pixels_label(i,j);              % ground truth pixels label?
        vot(index,label) =  vot(index,label) + 1;
         
        if(i+1<=raw)
            index_down = segments(i+1,j);
            neigh_relation(index,index_down) = 1;
        end
        if(i-1>0)
            index_up = segments(i-1,j);
            neigh_relation(index,index_up) = 1;
        end
        if(j+1<=col)
            index_right = segments(i,j+1);
            neigh_relation(index,index_right) = 1;
        end
        if(j-1>0)
            index_left = segments(i,j-1);
            neigh_relation(index,index_left) = 1;
        end      
    end
end

[~,gt_label] = max(transpose(vot));

flag = ones(1,Ns);
temp = (gt_label==8);  % 1*Ns logical
for i=1:Ns
    neigh_relation(i,i) = 0;
    if(temp(:,i)==1)
        if((vot(i,8)/sum(vot(i,:)))>=0.5)  % big than 0.5 , remove this node
            flag(:,i) = 0;                  % flag: 0 represent this node needs to be remove
        else
            vot(i,8) = 0;                  % small than 0.5, change label to second order label
        end
    end 
end
[~,gt_label] = max(transpose(vot));
% remove edge(belong to the removed node)

% ind = find(flag==0);    
% neigh_relation(ind,:) = 0;
% neigh_relation(:,ind) = 0;


[r,c] = find(neigh_relation);
neigh_relation1 = tril(neigh_relation);
[r2,c2] = find(neigh_relation1);
