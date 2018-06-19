clear all; close all; clc;

file = '..\Data\P3\higado.bmp';
% Number of interesting points
k = 6;
% Set true to show oversegmentation
plot = false;
% Apply watershed
myWatershed(file, k, plot);