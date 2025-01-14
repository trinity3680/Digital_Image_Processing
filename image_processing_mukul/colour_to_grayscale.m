% Created on 09/01/25
% Created by Mukul Sharma, BT22ECE112
% First Practical to convert Color image to Grayscale.


clc
clear all
close all

% Reading the image
I = imread('image1.jpg');

% Displaying value of a specified pixel
disp(I(400,600));

% Grayscale img using single layer of color img
I_gray1 = I(:,:,1);

% Grayscale img using average method
I_r = I(:,:,1);
I_g = I(:,:,2);
I_b = I(:,:,3);
I_gray2 = round((I_r+I_g+I_b)/3);                           

% Grayscale img using luminosity method
I_gray3 = round(0.299*I_r+0.587*I_g+0.114*I_b);

% Red version of image
Ired = I;
Ired(:,:,2) = 0;
Ired(:,:,3) = 0;

% Green version of image
Igreen = I;
Igreen(:,:,1) = 0;
Igreen(:,:,3) = 0;

% Blue version of image
Iblue = I;
Iblue(:,:,1) = 0;
Iblue(:,:,2) = 0;

% Displaying RGB versions
figure(1)
subplot (2,2,1), imshow(I); xlabel('Reference Image');
subplot (2,2,2), imshow(I_gray1); xlabel('Grayscale Image #1');
subplot (2,2,3), imshow(I_gray2); xlabel('Grayscale Image #2');
subplot (2,2,4), imshow(I_gray3); xlabel('Grayscale Image #3');


% Displaying Grayscale versions using various methods
figure(2)
subplot (2,2,1), imshow(I); xlabel('Reference Image');
subplot (2,2,2), imshow(Ired); xlabel('Red Image');
subplot (2,2,3), imshow(Igreen); xlabel('Green Image');
subplot (2,2,4), imshow(Iblue); xlabel('Blue Image');