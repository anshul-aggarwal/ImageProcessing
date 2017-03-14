%Gradient image sharpening

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

for m = 1:r
    for n = 1:c
        gx(m,n) = z(m+1,n+1) - z(m+1,n+2);
        gy(m,n) = z(m+1,n+1) - z(m+2,n+1);
        g(m,n) = sqrt(gx(m,n).^2 + gy(m,n).^2);
    end
end

g = uint8(g);
z = uint8(z);

for m = 1:r
    for n = 1:c
        h(m,n) =  z(m+1,n+1) - g(m,n);
    end
end

subplot(2,2,2)
imshow(g,[])
title('Gradient image sharpening - edges')

subplot(2,2,3)
imshow(h,[])
title('Resultant image')
