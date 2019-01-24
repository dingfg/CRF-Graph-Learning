function [npll,grd] = fun_obj_grd_knowngraph_1011(learner,data,w)
npll=w' * (w ./ (2 * learner.sigma_2));
grd=w ./ learner.sigma_2;
n=length(data);
nc=learner.nc;
aggre_loss=0;
grad_loss=zeros(size(w));

%% inserted by dfg
b = zeros(nc);
bw = true(nc);
b(tril(bw,0)) = w(4:end);
param = (b + b') ./ (ones(nc)+eye(nc));
%%
for i=1:n
    one_ins=data(i);
    
%     node_pot=zeros(length(one_ins.flag),nc);    % Ns,nc
    psi_gt=zeros(length(one_ins.flag),length(w));   % Ns , 
    psi_expect=zeros(length(one_ins.flag),nc,length(w));
    
    node_pot = w(1) * learner.state{i}.nodePot;
    psi_gt(:,1:3) = learner.state{i}.psi_gt;
    psi_expect(:,:,1:3) = learner.state{i}.psi_expect;
    
    
    r=one_ins.r_index;
    c=one_ins.c_index;
    dis_hsv=one_ins.dis_hsv;
    dis_euc=one_ins.dis_euc;
    
    for k=1:length(r)
        idx_r=r(k);
        idx_c=c(k);  
        lbl_r=one_ins.gt_super_label(idx_r);
        lbl_c=one_ins.gt_super_label(idx_c);
        if(lbl_r<=nc && lbl_c<=nc)
            edge_pot_r=dis_hsv(k)*w(2)+dis_euc(k)*w(3) + param(:,lbl_c)';
            edge_pot_c=dis_hsv(k)*w(2)+dis_euc(k)*w(3) + param(lbl_r,:);
            edge_pot_r(lbl_c)=(1-dis_hsv(k))*w(2)+(1-dis_euc(k))*w(3) + param(lbl_c,lbl_c);
            edge_pot_c(lbl_r)=(1-dis_hsv(k))*w(2)+(1-dis_euc(k))*w(3) + param(lbl_r,lbl_r);

            node_pot(idx_r,:)=node_pot(idx_r,:)+edge_pot_r;
            node_pot(idx_c,:)=node_pot(idx_c,:)+edge_pot_c;

            l_max = max(lbl_r,lbl_c);
            l_min = min(lbl_r,lbl_c);
            psi_gt(idx_r, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) = psi_gt(idx_r, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) + 1 ;  
            psi_gt(idx_c, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) = psi_gt(idx_c, 3 + (nc*l_min-(l_min^2-l_min)/2-nc+l_max) ) + 1 ;

            for j = 1:lbl_r
                psi_expect(idx_c,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_r) )=psi_expect(idx_c,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_r) ) + 1;            
            end
            for j = lbl_r+1:nc
                psi_expect(idx_c,j, 3 + (nc*lbl_r-(lbl_r^2-lbl_r)/2-nc+j ))=psi_expect(idx_c,j, 3 + (nc*lbl_r-(lbl_r^2-lbl_r)/2-nc+j )) + 1;         
            end
            for j = 1:lbl_c
                psi_expect(idx_r,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_c) )=psi_expect(idx_r,j, 3 + (nc*j-(j.^2-j)/2-nc+lbl_c) ) + 1; 
            end
            for j = lbl_c+1:nc
                psi_expect(idx_r,j, 3 + (nc*lbl_c-(lbl_c^2-lbl_c)/2-nc+j ))=psi_expect(idx_r,j, 3 + (nc*lbl_c-(lbl_c^2-lbl_c)/2-nc+j )) + 1;
            end
        end
    end
    
    grad_loss=grad_loss+sum(psi_gt,1)';
    % compute sum_i log(p_i(x_i^m|x_Ni^m,w))
    gt_spix_l=one_ins.gt_super_label;
    gt_spix_l(gt_spix_l==(nc+1))=1;
    aggre_loss_oneins=node_pot(sub2ind(size(node_pot),1:length(one_ins.flag),gt_spix_l));
    aggre_loss=aggre_loss+sum(aggre_loss_oneins);
    exp_node_pot=exp(node_pot);
    % zero out void superpixel
    sum_exp_node_pot=sum(exp_node_pot,2);
    partition_fun=log(sum_exp_node_pot+eps);
    partition_fun(~logical(one_ins.flag))=0;
    aggre_loss=aggre_loss-sum(partition_fun);
    %
    cond_pdf=exp_node_pot./repmat(sum_exp_node_pot,1,nc);
    psi_expect=psi_expect.*repmat(cond_pdf,1,1,234);
    psi_expect=squeeze(sum(sum(psi_expect,2),1));
    grad_loss=grad_loss-psi_expect;
    
end
npll=npll-1/n*aggre_loss;
grd=grd-1/n*grad_loss;
end