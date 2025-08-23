clc, clearvars;

im = imread('huy.png');
im = rgb2gray(im);


[h, w] = size(im);
n = h*w;
imin = uint8(min(im(:)));

dense = cumilative_density(im);

figure;
subplot(331); imshow(im); title('Gray Img');
subplot(332); histogram(im); title('Histogram before');
subplot(333); plot(dense); title('Cumilative density before');

% Transform levels in histogram
lv= uint8(dense * 225);

for i=1:h
    for j=1:w
        result(i,j) = lv(im(i,j)-imin+1);
    end
end

pix_freq = zeros(h,w);

dense = cumilative_density(result);

% Show img after using histogram equalization transform
subplot(334); imshow(result); title('My Equalized Img (Linear)');
subplot(335); histogram(result); title('Histogram after');
subplot(336); plot(dense); title('Cumilative density after')

[j, t] = histeq(im);
subplot(337); imshow(j); title('Built-in function Equalized Img')
subplot(338); histogram(j); title('Histogram after');
subplot(339); plot(t); title('Cumilative density after');

figure;
dif = abs(result - im);
dif(dif == 0) = 200;
imshow(dif); title('Equalize area')