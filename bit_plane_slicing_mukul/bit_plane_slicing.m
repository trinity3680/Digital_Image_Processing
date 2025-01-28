% Created on 23/01/25
% Created by Mukul Sharma, BT22ECE112
% Third Practical to perform bit plane slicing on given image and
% reconstructing the image after removing the LSB.
 
clc
clear aal
close all

% Read the colored image
image = imread('image1.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(image);

% Create a figure to display the bit planes
figure;
colormap('gray');

% Extract and display each bit plane
for bit = 7:-1:0
    % Extract the bit plane
    bitPlane = bitget(grayImage, bit+1);
    
    % Display the bit plane
    subplot(2, 4, bit+1); % Arrange subplots in 2 rows and 4 columns
    imshow(bitPlane * 255); % Scale to 255 for display purposes
    title(['Bit ' num2str(bit)]);
end

% Remove the LSB by setting the 1st bit to 0
% This is done by dividing the pixel values by 2 and then scaling back
reconstructedImage = bitshift(grayImage, -1); % Right shift to remove the LSB
reconstructedImage = uint8(reconstructedImage * 2); % Scale back to the original range

% Display the original and reconstructed images
figure;

% Original grayscale image
subplot(1, 2, 1);
imshow(grayImage);
title('Original Grayscale Image');

% Reconstructed image without LSB
subplot(1, 2, 2);
imshow(reconstructedImage);
title('Reconstructed Image (No LSB)');

