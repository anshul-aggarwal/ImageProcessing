i = imread('image.jpg');
i = rgb2gray(i);
[r,c] = size(i);

subplot(2,2,1)
imshow(i)
title('Original image')

%horizontal flip
for m = 1:r
    for n = 1:(c/2)
        tmp = i(m,n);
        i(m,n) = i(m, (c+1-n));
        i(m, (c+1-n)) = tmp;
    end
end

subplot(2,2,2)
imshow(i)
title('Horizontally flipped image')

%vertical flip
for m = 1:(r/2)
    for n = 1:c
        tmp = i(m,n);
        i(m,n) = i((r+1-m), n);
        i((r+1-m), n) = tmp;
    end
end

subplot(2,2,3)
imshow(i)
title('Vertically flipped image')
