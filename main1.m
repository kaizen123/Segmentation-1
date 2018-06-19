clear all; close all; clc;

% Load image and set the range for binary mask
file = '..\Data\P3\hueso.tif';
image = imread(file);
range = [240, 255];
mask = image(:,:) > range(1) & image(:,:) < range(2);
% Show original and mask
figure();
imshowpair(image, mask, 'montage');
title('Original (L) and masked (R) images');
% Select coordinates from mask
figure();
imshow(mask);
title('Select the seed');
[y,x] = getpts;
sem = int16([x,y]);
close all;
% Apply region growing segmentation
regGrowing(image, mask, sem);