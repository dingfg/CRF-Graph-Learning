function cl = splx_colors(lim,I) %#codegen

  S = max(lim(:));
  [r c ~] = size(I);

  %don't consider pixels at boundaries of superpixels 
  %for computing mean color
  
  lim_ = lim;
  [gx,gy] = gradient(double(lim));
  gidx = gx | gy;  
  lim_(gidx) = 0;
  
  
  smean = zeros(4,S);
    
  ssum2=zeros(3,S);
  svar=zeros(3,S);
    
  for i=1:r*c
    si = lim_(i);
    if si==0, continue; end
    rgb=[I(i);I(i+r*c);I(i+2*r*c)];
    smean(1:3,si) = smean(1:3,si)+rgb;
    smean(4,si) = smean(4,si)+1;          
    
    ssum2(:,si)=ssum2(:,si)+rgb.^2;
  end
 
  %some of the superpixels might have zero area
  %as the boundary pixels are not considered
  %recompute mean color with considering the boundary
  ii = find(smean(4,:)==0);
  for i=1:length(ii)
    ii2 = find(lim==ii(i));
    num = length(ii2);
    rgb=[I(ii2');I(ii2'+r*c);I(ii2'+2*r*c)];
    smean(1:3,ii(i)) = sum(rgb,2);
    smean(4,ii(i)) = num;    
    
    ssum2(:,ii(i))=sum(rgb.^2,2);
  end
  
  ii = find(smean(4,:)>1);  
  n=([1;1;1]*smean(4,ii));
  svar(:,ii) = (ssum2(:,ii) - (smean(1:3,ii).^2)./n)./(n - 1);

  smean(1:3,ii) = smean(1:3,ii)./n;
  
  %snorm = sum(smean(1:3,:),1);
  %chrom = [smean(1,:);smean(2,:)]./([1;1]*(snorm+eps));

  cl = [smean(1:3,:);svar];  
  
  %treat differently constant color regions
  %detect them as having all 3 channels similar
%  eps = 1e-3;
%  idx = find(sum(abs(smean(1:2,:)-smean(2:3,:)),1)<eps);
%  chrom(:,idx) = chrom(:,idx).*([1;1]*smean(1,idx));
  
%gg=ginput(1); lb=lim(round(gg(2)),round(gg(1))); chrom(:,lb), smean(1:3,lb)
