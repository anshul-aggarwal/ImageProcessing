i = imread('image.jpg');
i = rgb2gray(i);

[r,c] = size(i);

a = zeros(1, 256, 'uint16');
b = zeros(1, 256, 'uint16');
for m = 1:r
    for n = 1:c
        a(1, i(m,n) + 1) = a(1, i(m,n) + 1) + 1;
    end
end

for m = 1:256
    b(m) = m-1;
end

bar(b,a)
