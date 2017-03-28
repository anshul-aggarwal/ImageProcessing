%Contraharmonic Mean Noise Filter, 3X3

i = imread('noisyimage.jpg');

subplot(2,1,1)
imshow(i)
title('Noisy image')

[r,c] = size(i);

Q = -2;  
% Q = 0: Arithmetic Mean Filter
% Q = -1: Harmonic Mean Filter

g = zeros(r, c, 'double');
z = zeros(r+2,c+2,'uint8');
f = zeros(3,3,'double');

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
        f(1,2) = z(m-1,n);
        f(1,3) = z(m-1,n+1);
        f(2,1) = z(m,n-1);
        f(2,2) = z(m,n);
        f(2,3) = z(m,n+1);
        f(3,1) = z(m+1,n-1);
        f(3,2) = z(m+1,n);
        f(3,3) = z(m+1,n+1);
        
        g(m-1,n-1) = sum(sum(f.^(Q+1)),2)/sum(sum(f.^(Q)),2);
    end
end

g = uint8(g);

subplot(2,1,2)
imshow(g,[])
title('Filtered Image')
