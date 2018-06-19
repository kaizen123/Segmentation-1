function myWatershed( file, k , plot )
% Load and read image
image = imread(file);
image = rgb2gray(image);
% Apply high pass filter
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(image), hy, 'replicate');
Ix = imfilter(double(image), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);

if plot
    % Show oversegmented image
    L = watershed(gradmag);
    Lrgb = label2rgb(L);
    figure, imshow(Lrgb), title('Watershed transform of gradient magnitude (Lrgb)');
end
% Show original image to select minimum grey level for watershed
figure();
imshow(image);
drawnow;
[x,y] = ginput(int16(k));
x=int16(x);
y=int16(y);
% Create the mask
mask = zeros(size(image));
for i=1:size(x)
      mask(y(i)-3:y(i)+3, x(i)-3:x(i)+3) = 1;
end
% Show the original and mask overlapped
figure()
imshowpair(image, mask, 'blend')
% Compute watershed
gradmag = imimposemin(gradmag, mask);
segmented = watershed(uint8(gradmag));
% Show result
figure()
imagesc(segmented)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Watershed segmentation')
end

