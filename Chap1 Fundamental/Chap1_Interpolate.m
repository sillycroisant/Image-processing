clc; clearvars;

im = im2gray(imread('huy.png'));

[h, w] = size(im);
scale = 5; %CHANGE HERE

H = h*scale;
W = w*scale;

new = zeros(H,W,'uint8');

for i=1:H
    for j=1:W

        x = (i - 1)/scale +1;
        y = (j - 1)/scale +1;
        
        x1 = floor(x); x2 = min(x1+1, h);
        y1 = floor(y); y2 = min(y1+1, w);

        dx = x - x1;
        dy = y - y1;

        I11 = double(im(x1, y1));
        I12 = double(im(x1, y2));
        I21 = double(im(x2, y1));
        I22 = double(im(x2, y2));

        new(i,j) = uint8(I11*(1-dx)*(1-dy) + ...
                        I12*(1-dx)*dy + ...
                        dx*(1-dy)*I21 + ...
                        dx*dy*I22);
    end
end

figure;
subplot(121); imshow(im); title(['Origin img / size: ',num2str(size(im))]);
subplot(122); imshow(new); title(['Interpolated img / size: ',num2str(size(new))]);