clear all; close all; clc;

file = '..\Data\P3\hueso.tif';
rango = [240, 255];
% sem = zeros(2);

image = imread(file);
mask = image(:,:)>rango(1) & image(:,:)<rango(2);
figure();
imshowpair(image, mask, 'montage');
title('Original (L) and masked (R) images');
figure();
imshow(mask);
title('Select the seed');
[y,x] = getpts;
sem = int16([x,y]);
close all;

regGrowing(image, mask, sem);