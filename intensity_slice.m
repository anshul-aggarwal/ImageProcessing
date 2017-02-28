i = imread('image.jpg');
i = rgb2gray(i);

[r,c] = size(i);

x = input('Lower bound: ');
y = input('Upper bound: ');
a = ((i >= x) & (i <= y))*255; 
a = uint8(a);
subplot(2,1,1)
imshow(i)
title('Original image')
subplot(2,1,2)
imshow(a)
title('Intensity Slice')
