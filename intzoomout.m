i = imread('pangongtso.jpg');
i = rgb2gray(i);
figure,imshow(i)
[r,c] = size(i);

j = zeros(r/2, c/2, 'uint8');

for m = 1:r/2
    for n = 1:c/2
        j(m,n) = (i(2*m-1, 2*n-1)/4 + i(2*m, 2*n-1)/4 + i(2*m-1, 2*n)/4 + i(2*m, 2*n)/4);
    end
end

figure,imshow(j)
