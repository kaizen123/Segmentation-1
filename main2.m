clear all; close all; clc;
% Load file and set number of classes
file = '..\Data\P3\brain.bmp';
k = 4;
% Set true to hide distributions plot and boost algorithm
optimize = true;

image = imread(file);
image = rgb2gray(image);
% Select a ROI from original image
figure();
imshow(image);
title('Select the ROI');
roi = imrect;
position = wait(roi);
croppedImage = imcrop(image, position);
close;
% Apply EM segmentation
[mask,mu,v,p] = EMSeg(croppedImage, k, optimize);
% Color mask from EM
segmented = showSegmented( mask, k );
% Show original and segmented images side by side
figure();
imshowpair(croppedImage, segmented, 'montage');
title('Original (L) vs. segmented (R)');