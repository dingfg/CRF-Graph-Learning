function [r2,c2,gt_label,flag] = edge_and_gtlabel_1102(segment,gt_pixels_label,left,top,ul,ur,Ns,theta)

neigh_relation = zeros(Ns,Ns);
[raw,col] = size(segment);

vot = zeros(Ns,22);
for i=1:raw
    for j=1:col
        index = segment(i,j);                      % index :superpixel index?        
        label = gt_pixels_label(i,j);              % ground truth pixels label?
        vot(index,label) =  vot(index,label) + 1;
         
        if(i+1<=raw)
            index_down = segment(i+1,j);
            neigh_relation(index,index_down) = 1;
        end
        if(i-1>0)
            index_up = segment(i-1,j);
            neigh_relation(index,index_up) = 1;
        end
        if(j+1<=col)
            index_right = segment(i,j+1);
            neigh_relation(index,index_right) = 1;
        end
        if(j-1>0)
            index_left = segment(i,j-1);
            neigh_relation(index,index_left) = 1;
        end      
    end
end

[~,gt_label] = max(transpose(vot));

flag = ones(1,Ns);
temp = (gt_label==22);  % 1*Ns logical
for i=1:Ns
    neigh_relation(i,i) = 0;
    if(temp(:,i)==1)
        if((vot(i,22)/sum(vot(i,:)))>=0.5)  % big than 0.5 , remove this node
            flag(:,i) = 0;                  % flag: 0 represent this node needs to be remove
        else
            vot(i,22) = 0;                  % small than 0.5, change label to second order label
        end
    end 
end
[~,gt_label] = max(transpose(vot));
% remove edge(belong to the removed node)
% ind = find(flag==0);    
% neigh_relation(ind,:) = 0;
% neigh_relation(:,ind) = 0;


% [r,c] = find(neigh_relation);
neigh_relation1 = tril(neigh_relation);
[r2,c2] = find(neigh_relation1);  % can_edge


for i = 1:length(r2)
    c = c2(i);
    r = r2(i);
    ind_c = find(segment==c);
    ind_r = find(segment==r);
    ind_c_bottom = ind_c + 1;
    ind_c_ur = ind_c + size(segment,1) - 1;
    ind_c_right = ind_c + size(segment,1);
    ind_c_dr = ind_c + size(segment,1) + 1;
    
    l = 0;
    p_sum = 0;
    
    [ind,~,~] = intersect(ind_r,ind_c_bottom);
    l = l + length(ind);
    prob = top(ind);
    p_sum = p_sum + sum(prob);
    
    [ind,~,~] = intersect(ind_r,ind_c_ur);
    l = l + length(ind);
    prob = ur(ind-size(segment,1)+1);
    p_sum = p_sum + sum(prob);
    
    [ind,~,~] = intersect(ind_r,ind_c_right);
    l = l + length(ind);
    prob = left(ind);
    p_sum = p_sum + sum(prob);
    
    [ind,~,~] = intersect(ind_r,ind_c_dr);
    l = l + length(ind);
    prob = ul(ind);
    p_sum = p_sum + sum(prob);
    
    if(p_sum / l < theta)
        neigh_relation(c,r) = 0;
        neigh_relation(r,c) = 0;
    end
end

neigh_relation2 = tril(neigh_relation);
[r2,c2] = find(neigh_relation2);  % can_edge


end