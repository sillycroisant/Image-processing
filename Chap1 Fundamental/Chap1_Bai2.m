clc; clearvars; close;

img = imread('huy.png');

im1 = quantize(img, 6);
im2 = quantize(img, 4);
im3 = quantize(img, 2);

subplot(221);
imshow(img); title('Origin Img / 8-bit');

subplot(222);
imshow(im1); title('6-bit Quantized');

subplot(223);
imshow(im2); title('4-bit Quantized');

subplot(224);
imshow(im3); title('2-bit Quantized');