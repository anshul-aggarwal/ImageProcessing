%Sobel image sharpening, 3X3 mask

i = imread('image.jpg');
i = rgb2gray(i);

subplot(2,2,1)
imshow(i)
title('Original image')

[r,c] = size(i);

g = zeros(r, c, 'double');
gx = zeros(r, c, 'double');
gy = zeros(r, c, 'double');
h = zeros(r, c, 'uint8');
z = zeros(r+2,c+2,'uint8');

%Zero padding
for m = 1:r
    for n = 1:c
        z(m+1,n+1) = i(m,n);
    end
end

z = double(z);

for m = 2:r+1
    for n = 2:c+1
        gx(m-1,n-1) = -z(m-1,n-1) + z(m-1,n+1) - z(m+1,n-1) + z(m+1,n+1) - 2*z(m,n-1) + 2*z(m,n+1);
        gy(m-1,n-1) = -z(m-1,n-1) - z(m-1,n+1) - 2*z(m-1,n) + z(m+1,n+1) + z(m+1,n-1) + 2*z(m+1,n);
        g(m-1,n-1) = sqrt(gx(m-1,n-1).^2 + gy(m-1,n-1).^2);
    end
end

g = uint8(g);
z = uint8(z);

for m = 1:r
    for n = 1:c
        h(m,n) = -g(m,n) + z(m+1,n+1);
    end
end

subplot(2,2,2)
imshow(g,[])
title('Sobel image sharpening - edges')

subplot(2,2,3)
imshow(h,[])
title('Resultant image')

