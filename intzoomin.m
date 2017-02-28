i = imread('image.jpg');
i = rgb2gray(i);
figure,imshow(i)
[r,c] = size(i);

j = zeros(2*r, 2*c, 'uint8');

for m = 1:r
    for n = 1:c
        j(2*m-1, 2*n-1) = i(m,n);
        j(2*m, 2*n-1) = i(m,n);
        j(2*m-1, 2*n) = i(m,n);
        j(2*m, 2*n) = i(m,n);
    end
end

figure,imshow(j)
