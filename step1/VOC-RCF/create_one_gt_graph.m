function  create_one_gt_graph( gt  , name)

     result_left = ones(size(gt));
     result_top = ones(size(gt));
     result_ul = ones(size(gt));
     result_ur = ones(size(gt));
     
     for height = 1:size(gt,1)
         if(height>1)
             top = find(gt(height,:)==gt(height-1,:) & gt(height,:)~=255 );         % have edge
             result_top(height,top) = 0;
             ul = find(gt(height,2:end)==gt(height-1,1:end-1) & gt(height,2:end)~=255);
             result_ul(height,ul+1) = 0;
             ur = find(gt(height,1:end-1)==gt(height-1,2:end) & gt(height,1:end-1)~=255);
             result_ur(height,ur) = 0;
         end
     end
     result_top(1,:) = 0;
     result_ul(1,:) = 0;
     result_ul(:,1) = 0;
     result_ur(1,:) = 0;
     result_ur(:,size(gt,2)) = 0;
     
     for width = 1:size(gt,2)
         if(width>1)
             left = find(gt(:,width)==gt(:,width-1) & gt(:,width)~=255 );
             result_left(left,width)=0;  
         end
     end
     result_left(:,1) = 0;
     
    result_left = double(bwmorph(result_left,'thin',Inf));
    result_top = double(bwmorph(result_top,'thin',Inf));
    result_ul = double(bwmorph(result_ul,'thin',Inf));
    result_ur = double(bwmorph(result_ur,'thin',Inf));

     delta = 2;
     for h = 1:size(gt,1)
         for w= 1:size(gt,2)
             if(result_left(h,w)==1)
                if(w-1>0 && result_left(h,w-1) < exp(-(1/delta)^2) )
                        result_left(h,w-1)= exp(-(1/delta)^2);
                end
                if(w-2>0 && result_left(h,w-2) < exp(-(2/delta)^2))
                    result_left(h,w-2)= exp(-(2/delta)^2);
                end
             end
             
             if(result_top(h,w)==1)
                if(h-1>0 && result_top(h-1,w) < exp(-(1/delta)^2))
                    result_top(h-1,w) = exp(-(1/delta)^2);
                end
                if(h-2>0 && result_top(h-2,w) < exp(-(2/delta)^2))
                    result_top(h-2,w) = exp(-(2/delta)^2);
                end
             end   
             if(result_ul(h,w)==1)  
                if(h-1>0 && w-1>0 && result_ul(h-1,w-1) < exp(-(1/delta)^2))
                    result_ul(h-1,w-1) = exp(-(1/delta)^2);
                end
                if(h-2>0 && w-2>0 && result_ul(h-2,w-2) < exp(-(2/delta)^2))
                    result_ul(h-2,w-2) = exp(-(2/delta)^2);
                end
             end  
             if(result_ur(h,w)==1)
                if(h-1>0 && w+1<=size(gt,2) && result_ur(h-1,w+1) < exp(-(1/delta)^2))
                    result_ur(h-1,w+1) = exp(-(1/delta)^2);
                end
                if(h-2>0 && w+2<=size(gt,2) && result_ur(h-2,w+2) < exp(-(2/delta)^2))
                    result_ur(h-2,w+2) = exp(-(2/delta)^2);
                end
             end
         end
     end

     result_left = repmat(uint8(result_left*255),1,1,3);
     result_top = repmat(uint8(result_top*255),1,1,3);
     result_ul = repmat(uint8(result_ul*255),1,1,3);
     result_ur = repmat(uint8(result_ur*255),1,1,3);
     
     imwrite(result_left,['gt/gt_left/' name '.png']);
     imwrite(result_top,['gt/gt_top/' name '.png']);
     imwrite(result_ul,['gt/gt_ul/' name '.png']);
     imwrite(result_ur,['gt/gt_ur/' name '.png']);

end

