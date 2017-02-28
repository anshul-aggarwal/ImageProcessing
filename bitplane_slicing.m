%8-bit bitplane slicing

i = imread('image.jpg');
i = rgb2gray(i);
subplot(3,3,9)
imshow(i)
title('Original image')
[r,c] = size(i);

%a = zeros(8,r,c,'uint8');
for k = 1:8
    a = zeros(r,c,'uint8');
    for m = 1:r
        for n = 1:c
            a(m,n) = 255*(mod(idivide(i(m,n),(2^(k-1)),'floor'), 2));
        end
    end
    subplot(3,3,k)
    imshow(a)
    title(k)
end
