function inc = adjacency_to_incidence(adj)
    % incMatrix=adjacency_to_incidence(tril(adjMatrix));                                % graph = adjacency_to_incidence(graph_adj);
    
    adj=adj | adj'; %ensure symetric   % 下三角翻到上三角。变成了对称矩阵                       % graph_adj本来也是对称，确保为对称矩阵  148*148
    n=length(adj);                                                                       % 148
    
    [rows cols] = find(triu(adj));   % triu提取矩阵上三角矩阵  find查询非零元素的位置，返回位置     % 147*1行索引,147*1列索引，有147对，即147条edge
    ne=length(rows);                 % 即ne为非0元素的个数                                   % 147
    e_idx=[1:ne,1:ne]';              % 生成从1到ne再从1到ne的列向量： 2×ne * 1                 % 294*1
    n_idx=[rows;cols];               %                                                    % 294*1
    
    inc = sparse(e_idx, n_idx, true, ne, n);   % % 依次取e_idx,n_idx中的值作为T的行标和列标，再在true中的值赋值到inc（ne*n）中所对应的行标和列标
    
    
  
  