%Bai 10. Cho I la anh xam, nhieu muoi tieu (salt&pepper noise) voi ti le p = 0.1 vao anh I,
%thu dc anh I1. Goi H = 1/16[1 2 1; 2 4 2; 1 2 1]
%a, Loc I1 bang H. Hien thi ket qua va so sanh vs I
%b, Dung bo loc Median, kich thuoc 3x3 de loc anh I1. Hien thi ket qua
%c, Thay doi p cua nhieu muoi tieu, p = 0.4. Lam lai cau b. Nhan xet ket
%qua. Neu ket qua ko tot, de xuat cach xu ly
% p = ti le nhieu xuat hien trong anh

im = im2gray(imread('huy.png'));

i1 = imnoise(im, 'salt & pepper', 0.1);

H_filter = (1/16*[1 2 1; 2 4 2; 1 2 1]); %Low-pass filter

y1 = uint8(conv2(double(i1), double(H_filter),'same'));

figure;

subplot(221); imshow(im); title('Origin Img');

subplot(222); imshow(i1); title('SaltPepper Img');

subplot(223); imshow(uint8(y1)); title('Gaussian Fitler');

medFiltImg = medfilt2(i1,[3,3]);

subplot(224); imshow(medFiltImg); title('After Median Filter');
% Median filter work better when dealing with saltpepper noise !!!

% What if there are more saltpepper in img (p = 0.4)
% there're 2 way = increase the filter size and/or filter 
% the noise img more many times

i2 = imnoise(im, 'salt & pepper', 0.4);

figure;

subplot(231); imshow(i2); title('p = 0.4 saltpepper')

% the first filter should not too big ([3x3] is enough)
% or else it will make the img look broken (I TRIED)
oneTime = medfilt2(i2, [3,3]);
subplot(232); imshow(oneTime); title('Median Filter 3x3');

twoTime = medfilt2(oneTime, [5,5]);
subplot(233); imshow(twoTime); title('Median Filter 3x3');
 
threeTime = medfilt2(twoTime, [5,5]);
subplot(234); imshow(threeTime); title('Median filter 5x5');

fourTime = uint8(conv2(threeTime, H_filter,'same'));
subplot(235); imshow(fourTime); title('Gaussian filter');

subplot(236); imshow(im); title('Origin img');


figure;
imshowpair(im,fourTime,'diff');