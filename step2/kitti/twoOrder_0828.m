function x  = twoOrder_0828(crf,learned_params)

num_nodes = crf.num_nodes;
num_edges = crf.num_edges;

p= -log(max(transpose(crf.nodePot),eps));                         
fpot1 = p;   
nodePot = -(learned_params(1) * fpot1); %  必须double 不能是single

nc=7;
b = zeros(nc);
bw = true(nc);
b(tril(bw,0)) = learned_params(4:3+28);
param = (b + b') ./ (ones(nc)+eye(nc));

gm = openGMModel;

temp = ones(1,num_nodes)*nc;
gm.addVariables(temp);

gm.addUnaries(0:num_nodes-1, double(nodePot));

% for i =1:num_edges
%     twoOrderFunction = openGMExplicitFunction([21, 21],squeeze(edgePot(:,:,i))); 
%     gm.addFunction(twoOrderFunction);
%     gm.addFactors(twoOrderFunction, [crf.c_index(i)-1 ; crf.r_index(i)-1]);
% end
% aa = [crf.c_index-1,crf.r_index-1];
% gm.addPairwiseTerms(aa',reshape(permute(edgePot,[2,1,3]),21*21,num_edges));

pairwise=zeros(nc*nc,num_edges);
ind_diag=sub2ind([nc,nc],1:nc,1:nc);
for j=1:num_edges
    pairwise(:,j)=crf.dis_hsv(j)*learned_params(2)+crf.dis_euc(j)*learned_params(3) ;
    pairwise(ind_diag,j)=(1-crf.dis_hsv(j))*learned_params(2)+(1-crf.dis_euc(j))*learned_params(3) ;
end
gm.addPairwiseTerms([crf.c_index-1,crf.r_index-1]', - (pairwise+repmat(param(:),1,num_edges)) );%%%%%%%%%%%%%%%%%%%%%%%%%


% common/call/inference_caller_base.hxx   messagepassing_caller.hxx
% inferenceResults = opengm('m', gm, 'a', 'BELIEFPROPAGATION', 'p', 1,...
%     'timeout',inf, 'maxIt', 200, 'bound', 0.000001,'gaplimit',0,'memlogging',1,'damping',0.1);
inferenceResults = opengm('m', gm, 'a', 'ALPHABETASWAP', 'p', 1,...
    'timeout',inf, 'maxIt', 200, 'bound', 0.000001,'gaplimit',0,'memlogging',1,'damping',0.1,'scale',1,'maxflow','BOOST_KOLMOGOROV');

x = inferenceResults.states(:,1:num_nodes);

end
