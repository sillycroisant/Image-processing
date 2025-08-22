%[B?i 4]: Goi I là mot anh xam/mau. 
%Goi Y la anh duoc tao ra nhu sau Y = I+N,
%voi N có cùng kích thuoc voi I va N là nhieu Gaussian có mean
%m = 0 và standard deviation std = 5. Hien thi I và Y.
%Tinh mean và std cua I. Tính mean v? std cua Y.
%Cat mat patch bat k? k?ch thuoc 10x10 tu ), 
%sau d? t?nh mean v? std cua patch n?y. 
%Thuc hien lai voi Y (ch? ? patch tu I v? Y deu duoc lay
%tu c?ng toa d?). Nhan x?t

clc; close; clearvars;

i = imread('huy.png');

gray = rgb2gray(i);

[row, col, dim] = size(i);

gauss_noise = uint8(normrnd(0,5,[row, col, dim]));


y = i + gauss_noise;

ax = randi([0,row], 1,1);
ay = randi([0,col], 1,1);

p1 = i(ax:ax+9, ay:ay+9,:);
p2 = y(ax:ax+9, ay:ay+9,:);

m1 = mean(p1, "all");
m2 = mean(p2, "all");

std1 = std2(p1);
std2 = std2(p2);

figure;
subplot(221); imshow(i); title("origin img");
subplot(222); imshow(y); title("gaussian noise added img");

subplot(223); imshow(p1); title(['mean: ', num2str(m1) ,' / std: ',num2str(std1)]);
subplot(224); imshow(p2); title(['mean: ', num2str(m2) ,' / std: ',num2str(std2)]);



