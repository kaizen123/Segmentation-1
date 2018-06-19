% Demo of "Chan Vese Level Sets"
%
% Example:
% seg_demo
%
% Coded by: Shawn Lankton (www.shawnlankton.com)
clear all; close all; clc;
I = imread('..\Data\P3\ec.jpg');  %-- load the image
m = zeros(size(I,1),size(I,2));          %-- create initial mask
% m(100:125,100:125) = 1;
m(100:150,100:150) = 1;
% prev_area = 10479
max_area = 10000;
display = true;



subplot(2,2,1); imshow(I); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');
% [800, 3.0], [1000, 3.0],[800, 2.0]
seg = chanvese(I, m, 800, 2.0, display, max_area); %-- Run segmentation

subplot(2,2,4); imshow(seg); title('Global Region-Based Segmentation');


