%Noise - Erlang

i = imread('image.jpg');
i = rgb2gray(i);

a = 0.5; 
k = -1/a; %Mean
b = 10; %Stddev

subplot(2,2,1)
title('Noise Histogram')

[r,c] = size(i);
n = zeros(r,c,'double');

i = double(i);
for q = 1:b
    n = n + k*(log(1-rand(r,c)));
end
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
