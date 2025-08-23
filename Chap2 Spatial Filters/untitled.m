
clc; close; clearvars

img = imread('huy.png');
grayImg = rgb2gray(img);

vmax = double(max(grayImg(:)));
vmin = double(min(grayImg(:)));

[row, col, ~] = size(img);

L = 255;
bin = 50;

%result = uint8((double(grayImg) - vmin) / (vmax - vmin) * L);
result = histeq(grayImg, bin);

subplot(231);
imshow(grayImg); title('Gray Img');
subplot(232);
(histogram(grayImg)); title('Histogram');
subplot(233);
ecdf(double(grayImg(:)));

subplot(234)
imshow(result); title('Stretched Img');
subplot(235);
histogram(result); title('Histogram');
subplot(236);
ecdf(double(result(:)));


dif = abs(grayImg - result);

figure;
imshow(dif);


function 
