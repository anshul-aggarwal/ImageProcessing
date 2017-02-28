i = imread('image.jpg');
i = rgb2gray(i);

[r,c] = size(i);

%a(1) = n_k, a(2) = p_k, a(3) = T_k, a(4) = s_k

a = zeros(4, 256, 'double');
b = zeros(1, 256, 'uint16');
x = zeros(1, 256, 'uint16');

for m = 1:r
    for n = 1:c
        a(1, i(m,n) + 1) = a(1, i(m,n) + 1) + 1;
    end
end

tot = r*c;

for m = 1:256
    a(2,m) = a(1,m)/tot;
end

sum = 0;

for m = 1:256
    sum = sum + a(2,m);
    a(3,m) = sum*255;
    a(4,m) = round(a(3,m));
end

for m = 1:256
    x(a(4,m) + 1) = x(a(4,m) + 1) + a(1,m);
end

for m = 1:256
    b(m) = m-1;
end

bar(b,x)
