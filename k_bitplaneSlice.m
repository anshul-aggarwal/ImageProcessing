i = imread('image.jpg');
i = rgb2gray(i);

[r,c] = size(i);

n = input('Number of bits: ');

a = zeros(r,c,'uint8');

a = i - mod(i, 2^(8-n));

%a = uint8(a);
subplot(2,1,1)
imshow(i)
title('Original image')
subplot(2,1,2)
imshow(a)
title('Slice')
