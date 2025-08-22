clearvars; close; clc;

img = imread('huy.png');

figure; imshow(img); title('Origin');

diameter = 100;
rad = ceil(diameter / 2);
[row, col,  ~] = size(img);

ax = randi([rad,row-rad],1,1);
ay = randi([rad,col-rad],1,1);

bx = row - ax;
by = col - ay;

new_img = uint8(zeros(row+diameter, col+diameter,3));
new_img(rad+1:row+rad,rad+1:col+rad,:) = img(1:end,1:end,:);

% swap 2 patchs
temp1 = new_img(ax-rad:ax+rad, ay-rad:ay+rad, :);
new_img(ax-rad:ax+rad, ay-rad:ay+rad,:) = new_img(bx-rad:bx+rad, by-rad:by+rad,:);
new_img(bx-rad:bx+rad, by-rad:by+rad,:) = temp1;

img = new_img(rad+1:row+rad,rad+1:col+rad,:);

figure; imshow(img); title('Swapped');
