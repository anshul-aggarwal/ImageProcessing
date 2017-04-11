%Adaptive Mean Noise Filter, 3X3

i = imread('noisyimage.jpg');

subplot(2,1,1)
imshow(i)
title('Noisy image')

[r,c] = size(i);

sd_n = 5; %Noise Standard Deviation

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
        
        loc_mean = mean(f);
        loc_sd = std(f);
        
        mulf = ((sd_n.^2)/(loc_sd.^2));
        if mulf > 1
            mulf = 1;
        end           
        
        g(m-1,n-1) = z(m,n) - mulf*(z(m,n) - loc_mean);
    end
end

g = uint8(g);

subplot(2,1,2)
imshow(g,[])
title('Filtered Image')
