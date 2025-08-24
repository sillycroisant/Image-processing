clc, clearvars;

im = im2gray(imread('huy.png'));

% Without Gaussian noise
h = [1 -2 1];

y1 = uint8(conv2(im,h,'same'));
y2 = uint8(conv2(im,h.','same'));

figure;
subplot(231); imshow(y1);
subplot(232); imshow(y2);
subplot(233); imshow(y1+y2);

% With Gaussian noise
im = im + uint8(normrnd(0,5,size(im))); %CHANGE HERE
y1 = uint8(conv2(im,h,'same'));
y2 = uint8(conv2(im,h.','same'));

subplot(234); imshow(y1);
subplot(235); imshow(y2);
subplot(236); imshow(y1+y2);