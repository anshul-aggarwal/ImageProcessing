i = imread('image.jpg');
i = rgb2gray(i);
figure,imshow(i)
[r,c] = size(i);

zoomf_r = 1.25;
zoomf_c = 1.25;

r2 = zoomf_r*r;
c2 = zoomf_c*c;

j = zeros(r2, c2, 'uint8');

for m = 1:r2
    for n = 1:c2
        x = 1 + (r-1)*(m-1)/(r2-1);
        y = 1 + (c-1)*(n-1)/(c2-1);
        x = round(x);
        y = round(y);
        j(m,n) = i(x,y);
    end
end

figure,imshow(j)
