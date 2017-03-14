%High boost filtering, 3X3 mask

i = imread('image.jpg');
i = rgb2gray(i);

k = 1.3;

subplot(2,2,1)
imshow(i)
title('Original image')

[r,c] = size(i);

g = zeros(r, c, 'double');
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
        g(m-1,n-1) = ((z(m-1,n-1) + z(m-1,n+1) + z(m+1,n-1) + z(m+1,n+1))*(exp(-1))+ (z(m-1,n) + z(m+1,n) + z(m,n-1) + z(m,n+1))*(exp(-0.5)) + z(m,n))/(4*exp(-1) + 4*exp(-0.5) + 1);
    end
end

g = uint8(g);

h = i-g;
p = i + k*h;

subplot(2,2,2)
imshow(h,[])
title('High boost filter')

subplot(2,2,3)
imshow(p,[])
title('Resultant image')
