%%% compute tree-structured graph using minimum spanning tree
%   measure: 'distance' indicates euclidean distance, 'color'
%            indicates lab color
%   graph: .G is the adjacent matrix; .N is the node list;
%          .E is the edge table
%
function graph = compute_im_graph_tree(stats,lab,dis,measure)
if length(stats) > 1000000
    error('too many super-pixels!');
end

graph.N=1:length(stats);
largeValue=1e5;
weiMat=largeValue*ones(length(stats));
weiMat(1:length(stats)+1:length(stats)*length(stats))=0;
weiMat2=weiMat;

all_edges_im=zeros(1000000,2);
cc=0;
for k=1:length(stats);
    knd=find(weiMat(k,:));
    all_edges_im(cc+1:cc+length(knd),:)=[k*ones(length(knd),1) knd'];
    cc=cc+length(knd);
end
all_edges_im(cc+1:end,:)=[];
all_edges_im=unique(sort(all_edges_im,2),'rows');
all_edges_im2=all_edges_im;

if strcmp(measure,'tree_distance') || strcmp(measure,'color_and_dis') || strcmp(measure,'color_or_dis') || strcmp(measure,'color_sum_dis')
    for k=1:size(all_edges_im,1)
        e1=all_edges_im(k,1);
        e2=all_edges_im(k,2);
        weiMat(e1,e2)=sum((dis(1:2,e1)-dis(1:2,e2)).^2);
        weiMat(e2,e1)=weiMat(e1,e2);
    end
    g_adj=logical(mst_nochecks(sparse(weiMat)));
end
if strcmp(measure,'tree_color') || strcmp(measure,'color_and_dis') || strcmp(measure,'color_or_dis') || strcmp(measure,'color_sum_dis')
    for k=1:size(all_edges_im2,1)
        e1=all_edges_im2(k,1);
        e2=all_edges_im2(k,2);
        weiMat2(e1,e2)=sum((lab(1:3,e1)-lab(1:3,e2)).^2);
        weiMat2(e2,e1)=weiMat2(e1,e2);
    end
    g_adj2=logical(mst_nochecks(sparse(weiMat2)));
end 
if strcmp(measure,'color_sum_dis')
    g_adj3=logical(mst_nochecks(sparse(weiMat2+weiMat)));
end
if strcmp(measure,'tree_distance')
    g_ind=adjacency_to_incidence(g_adj);
    graph.G=g_adj;
elseif strcmp(measure,'tree_color')
    g_ind=adjacency_to_incidence(g_adj2);
    graph.G=g_adj2;
elseif strcmp(measure,'color_and_dis')
    temp_mat=g_adj & g_adj2;
    g_ind=adjacency_to_incidence(temp_mat);
    graph.G=temp_mat;
elseif strcmp(measure,'color_sum_dis')
    g_ind=adjacency_to_incidence(g_adj3);
    graph.G=g_ind;
else
    temp_mat=g_adj | g_adj2;
    g_ind=adjacency_to_incidence(temp_mat);
    graph.G=temp_mat;
end
edges=zeros(size(g_ind,1),2);
for k=1:size(g_ind,1)
    e=find(g_ind(k,:));
    edges(k,:)=e;
end
graph.E=edges;
end