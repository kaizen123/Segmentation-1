function myWatershed( file, k )
%MYWATERSHED Summary of this function goes here
%   Detailed explanation goes here
image = imread(file);
image = rgb2gray(image);

hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(image), hy, 'replicate');
Ix = imfilter(double(image), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);


% L = watershed(gradmag);
% Lrgb = label2rgb(L);
% figure, imshow(Lrgb), title('Watershed transform of gradient magnitude (Lrgb)')

imshow(image)
drawnow
mask = zeros(size(image));
[x,y] = ginput(double(k));
x=int64(x);
y=int64(y);

for i=1:size(x)
      mask(y(i)-3:y(i)+3, x(i)-3:x(i)+3) = 1;
end
figure()
imshowpair(image, mask, 'blend')

gradmag = imimposemin(gradmag, mask);
segmented = watershed(uint8(gradmag));

figure()
imagesc(segmented)
set(gca,'xtick',[])
set(gca,'ytick',[])
title('Watershed segmentation')
end

