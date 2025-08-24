i = imread('huy.png');
g = im2gray(i);

gaus_noise = normrnd(0,10,size(g)); % change here for demo

h = ([1 2 1; 2 4 2; 1 2 1])/20; % change here
i1 = g + uint8(gaus_noise);

figure;
subplot(221), imshow(g), title('Origin');

out_a = uint8(conv2(i1,h,'same'));

subplot(222); imshow(i1); title('Noised img');

subplot(223); imshow((out_a)); title('Filtered img');

subplot(224); imshowpair(out_a, g, 'diff'); title('Filtered area')

sum(dif(:));

% comment:
% gaussian filter helps remove some noise
% but also in the meantime also smooth out the edges of object in the img
% such as the area between objects and background in 4th img