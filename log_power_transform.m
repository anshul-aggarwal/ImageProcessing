i = imread('image.jpg');
i = rgb2gray(i);
subplot(2,2,1)
imshow(i)
title('Original image')
i = double(i);
%figure,imshow(i)
[r,c] = size(i);

lt_c = 100;
pt_c = 1.2;
pt_g = 0.7;

j = zeros(r,c,'double');

for m = 1:r
    for n = 1:c
        j(m,n) = lt_c*log10(1+i(m,n));
    end
end
%figure,imshow(i)
j = uint8(j);

subplot(2,2,2)
imshow(j, [])
title('Log transform')

k = zeros(r,c,'double');


for m = 1:r
    for n = 1:c
        k(m,n) = pt_c*((i(m,n))^pt_g);
    end
end
%figure,imshow(i)

k = uint8(k);

subplot(2,2,3)
imshow(k,[])
title('Power transform')
