clear all; close all; clc;

file = '..\Data\P3\brain.bmp';
k = 6;
optimize = true;

image = imread(file);
image = rgb2gray(image);
figure();
imshow(image);
title('Select the ROI');
roi = imrect;
position = wait(roi);

croppedImage = imcrop(image, position);
close;

[mask,mu,v,p] = EMSeg(croppedImage, k, optimize);
segmented = showSegmented( mask, k );

figure();
imshowpair(croppedImage, segmented, 'montage');
title('Original (L) vs. segmented (R)');