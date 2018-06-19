function regGrowing(imagen, mask, sem)
% Get (x, y) coordinates of each non-zero pixel on mask
regions = regionprops(mask, 'PixelList');
% Look for the region that contains (x, y) coordinates of the seed and get region index 
for i = 1 : size(regions)
    region =regions(i).PixelList;
    if ismember(sem, region)
        selected_region = i;
        break;
    end
end

% Color the entire where the seed is and remark the seed coordinates.
% If not display an error and close all opened figures
figure()
if selected_region ~=0
    imshow(imagen)
    hold on
    pl=regions(selected_region).PixelList;
    plot(pl(:,1),pl(:,2),'r')
    plot(sem(2),sem(1),'xg')
    hold off
    title('Result of growing region');
else
    fprintf(2,'ERROR: La semilla no se encuentra en ninguna región\n');
    close
end

end