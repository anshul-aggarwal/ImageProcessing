%Crop image

i = imread('image.jpg');
i = rgb2gray(i);
[r,c] = size(i);

r1 = input('Enter Coordinate 1 row: ');
c1 = input('Enter Coordinate 1 col: ');
r2 = input('Enter Coordinate 2 row: ');
c2 = input('Enter Coordinate 2 col: ');

k = r2-r1+1;
l = c2-c1+1;
j = zeros(k, l, 'uint8');
a = 1;
b = 1;
for m = r1:r2
    b=1;
    for n = c1:c2
        j(a,b) = i(m,n);
        b = b+1;
    end
    a = a+1;
end

subplot(1,2,1) % first subplot
imshow(i)
title('Full image')
subplot(1,2,2) % first subplot
imshow(j)
title('Cropped image')
