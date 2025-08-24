clc, clearvars;

im = im2gray(imread('huy.png'));

add = im + 50;
sub = im - 50;
mul = im * 1.5;
div = im / 1.5;

figure;
subplot(221); imshow(add); title("Addition img");
subplot(222); imshow(sub); title('Subtraction img');
subplot(223); imshow(mul); title('Multiply img');
subplot(224); imshow(div); title('Divide img')

% Add pixels to img make it brighter, while subtract make it darker.
% Multiply img help increase the contrast while divide decrease it.

dif1 = mul - add;
dif2 = div - sub;

figure;
subplot(131); imshow(im); title('origin img');
subplot(132); imshow(dif1); title('Diff in Multiply and Add');
subplot(133); imshow(dif2); title('Diff in Divide and Subtract');

% Those area that are more bright in the origin img will like to become
% bright in multiply operation compared to addition. And vice verse for the
% divide and subtract operation as well in those shading area.