 %Fourier Transformation and Inverse Fourier Transformation

f = imread('image2.jpg');
f = rgb2gray(f);

f = double(f);

[r,c] = size(f);



a = zeros(r,c,'double');
b = zeros(r,c,'double');

f = complex(f,b);
F = complex(a,b);

%Fourier
for u = 0:r-1
    for v = 0:c-1
        for x = 0:r-1
            for y = 0:c-1
                F(u+1,v+1) = F(u+1,v+1) + f(x+1,y+1)*exp((-1i*2*pi)*(u*x/r + v*y/c));
            end
        end
    end
end

fI = complex(a,b);

%Inverse fourier
for x = 0:r-1
    for y = 0:c-1
        for u = 0:r-1
            for v = 0:c-1
                fI(x+1,y+1) = fI(x+1,y+1) + F(u+1,v+1)*exp((1i*2*pi)*(u*x/r + v*y/c));
            end
        end
    end
end

fI = fI/(r*c);
diff = f - fI; %This should be a zero matrix
