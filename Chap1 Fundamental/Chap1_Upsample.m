clc, clearvars;

im = im2gray(imread('huy.png'));

[h, w,] = size(im);
ratio = 5; % CHANGE HERE

up = zeros(h*ratio,w*ratio);

for i=1:h
    for j=1:w
        for ii=0:ratio-1
            for jj=0:ratio-1
                up(i*ratio-ii,j*ratio-jj) = im(i,j);
            end
        end
    end
end

up = uint8(up);

figure;

subplot(121); imshow(im); title(['origin img /size: ',num2str(size(im))]);

subplot(122); imshow(up); title(['up sample img /size: ', num2str(size(up))]);