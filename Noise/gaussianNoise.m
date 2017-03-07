%Noise - Gaussian

i = imread('image.jpg');
i = rgb2gray(i);

a = 50; %Mean
b = 5; %Stddev

subplot(2,2,1)
title('Noise Histogram')

[r,c] = size(i);

i = double(i);
n = a + b*randn(r,c);
n = uint8(n);

a = zeros(1, 256, 'uint16');
b = zeros(1, 256, 'uint16');
for m = 1:r
    for k = 1:c
        a(1, n(m,k) + 1) = a(1, n(m,k) + 1) + 1;
    end
end

for m = 1:256
    b(m) = m-1;
end

bar(b,a)

subplot(2,2,2)
imshow(n,[])
title('Noise')

n = double(n);
p = i + n;
p = uint8(p);

subplot(2,2,3)
imshow(p,[])
title('Noisy image')

i = uint8(i);
subplot(2,2,4)
imshow(i)
title('Original image')
