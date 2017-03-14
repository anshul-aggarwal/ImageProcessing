%Noise - Salt & Pepper

i = imread('image.jpg');
i = rgb2gray(i);

salt_p = 0.01;  %Probability of salt noise
pepper_p = 0.01; %Probability of pepper noise

[r,c] = size(i);

subplot(2,1,1)
imshow(i)
title('Original image')

n = rand(r,c);

for m = 1:r
    for k = 1:c
        if n(m,k) <= salt_p
            i(m,k) = 255;
        elseif n(m,k) >= 1-pepper_p
            i(m,k) = 0;
        end
    end
end

subplot(2,1,2)
imshow(i)
title('Noisy image')
