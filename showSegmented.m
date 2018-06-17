function [segmented] = showSegmented( mask, n )
 [h, w] = size(mask);
 segmented=zeros(h, w, 3);
 for x=1:h
    for y=1:w
        for z=1:n
            if mask(x,y)==z
                if z<=3
                    segmented(x,y,z)=255;
                else
                    segmented(x,y,1)=z*40;
                    segmented(x,y,2)=z*40;
                    
                end
            end
        end
    end
 end
 segmented = uint8(segmented);
end
