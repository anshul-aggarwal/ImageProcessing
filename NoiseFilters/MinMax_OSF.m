%Min/Max Noise Filter, 3X3
%Order Statistics Filtering

i = imread('noisyimage.jpg');

subplot(2,1,1)
imshow(i)
title('Noisy image')

[r,c] = size(i);

w = 1;
% w = 0: Min filter for salt noise
% w = 1: Max filter for pepper noise

g = zeros(r, c, 'double');
z = zeros(r+2,c+2,'uint8');
f = zeros(9,1,'double');

%Zero padding
for m = 1:r
    for n = 1:c
        z(m+1,n+1) = i(m,n);
    end
end

z = double(z);
z = z + 1e-10;

for m = 2:r+1
    for n = 2:c+1
        f(1,1) = z(m-1,n-1);
        f(2,1) = z(m-1,n);
        f(3,1) = z(m-1,n+1);
        f(4,1) = z(m,n-1);
        f(5,1) = z(m,n);
        f(6,1) = z(m,n+1);
        f(7,1) = z(m+1,n-1);
        f(8,1) = z(m+1,n);
        f(9,1) = z(m+1,n+1);
        
        g(m-1,n-1) = (1-w)*min(f) + w*max(f);
    end
end

g = uint8(g);

subplot(2,1,2)
imshow(g,[])
title('Filtered Image')
